# VPC
resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "MainVPC"
  }
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidrs)

  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = element(var.availability_zones, count.index)

  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet-${count.index}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "MainInternetGateway"
  }
}

# Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

# Associate Public Route Table with Public Subnets
resource "aws_route_table_association" "public_rta" {
  count = length(var.public_subnet_cidrs)

  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnet_cidrs)

  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "PrivateSubnet-${count.index}"
  }
}

# NAT Gateway
resource "aws_eip" "nat_eip" {
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = {
    Name = "MainNATGateway"
  }
}

# Private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "PrivateRouteTable"
  }
}

# Private Route Table Association with Private Subnets
resource "aws_route_table_association" "private_rta" {
  count = length(var.private_subnet_cidrs)

  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}

#Service control policies

data "aws_iam_policy_document" "prevent_deletion_policy" {
  version = "2012-10-17"
  statement {
    sid = "NoTamperCloudtrail"
    actions = [
      "cloudtrail:DeleteTrail",
      "cloudtrail:StopLogging",
      "rds:DeleteDBInstance",
      "ec2:DeleteVpc"
    ]
    effect    = "Deny"
    resources = ["*"]
  }
}

resource "aws_organizations_policy" "prevent_deletion_policy" {
  name        = "prevent-deletion-policy"
  description = "Prevent users or roles in any affected account from tampering with cloudtrail."
  type        = "SERVICE_CONTROL_POLICY"
  content     = data.aws_iam_policy_document.prevent_deletion_policy.json
}

resource "aws_organizations_policy_attachment" "sandbox" {
  policy_id = aws_organizations_policy.prevent_deletion_policy.id
  target_id = data.aws_organizations_organizational_unit.sandbox.id
}