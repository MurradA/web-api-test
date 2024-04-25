#vpc
aws_region = "eu-west-1"

vpc_cidr = "10.0.0.0/16"

public_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24"]

private_subnet_cidr = ["10.0.3.0/24", "10.0.4.0/24"]

availability_zones = ["eu-west-1a", "eu-west-1b"]

#ecs
ecs_cluster_name = "staging-ecs-cluster"

ecs_task_family = "staging-ecs-task-family"

ecs_task_cpu = "256"

ecs_task_memory = "512"

ecs_container_port = 80

ecs_container_name = "staging-ecs-container"

ecs_container_image = "nginx:latest"

ecs_service_name = "staging-ecs-service"

ecs_service_desired_count = 2

ecs_cpu_threshold = "50"

ecs_max_capacity = "10"

ecs_min_capacity = "1"

ecs_cpu_scale_up = "80"

ecs_cpu_scale_down = "20"

#rds
rds_allocated_storage = 10

rds_storage_type = "gp2"

rds_engine = "mysql"

rds_engine_version = "5.7"

rds_instance_class = "db.t2.micro"

#Use KMS for password encryption
rds_username = "admin"

rds_database_name = "staging-db"

rds_parameter_group_family = "mysql5.7"

rds_instance_identifier = "staging-rds-instance"

rds_cpu_threshold = "75"

ingress_cidr_alb = ["86.9.22.0/24"]

secret_length = 12

override_special_characters = "!#$%&*()-_=+[]{}<>:?"

parameter_name = "staging-rds-pw"

parameter_type = "SecureString"