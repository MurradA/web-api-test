<p align="center">
  <img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/ec559a9f6bfd399b82bb44393651661b08aaf7ba/icons/folder-markdown-open.svg" width="100" />
</p>
<p align="center">
    <h1 align="center">web-api-test</h1>
</p>
</p>
<p align="center">
	<img src="https://img.shields.io/badge/Terraform-7B42BC.svg?style=flat&logo=Terraform&logoColor=white" alt="Terraform">
	<img src="https://img.shields.io/badge/GitHub%20Actions-2088FF.svg?style=flat&logo=GitHub-Actions&logoColor=white" alt="GitHub%20Actions">
</p>
<hr>

##  Quick Links

> - [ Overview](#-overview)
> - [ Features](#-features)
> - [ Repository Structure](#-repository-structure)
> - [ Modules](#-modules)
> - [ Getting Started](#-getting-started)
>   - [ Installation](#-installation)
>   - [Running web-api-test](#-running-web-api-test)
> - [ Contributing](#-contributing)

---

##  Overview

<code>► This README provides instructions for deploying the infrastructure with Terraform on AWS. The infrastructure has modules</code>

---

##  Repository Structure

```sh
└── web-api-test/
    ├── .github
    │   └── workflows
    │       └── terraform-pipeline.yml
    ├── README.md
    ├── main.tf
    ├── modules
    │   ├── ecs
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   ├── rds
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   └── vpc
    │       ├── main.tf
    │       ├── outputs.tf
    │       └── variables.tf
    └── variables.tf
```

---

##  Modules

<details closed><summary>root</summary>

| File                                                                                           | Summary                         |
| ---                                                                                            | ---                             |
| [main.tf](https://github.com/Raihan11x/web-api-test/blob/master/main.tf)           | <code>► Variables</code> |
| [variables.tf](https://github.com/Raihan11x/web-api-test/blob/master/variables.tf) | <code>► Main Configuration</code> |

</details>

<details closed><summary>.github.workflows</summary>

| File                                                                                                                                 | Summary                         |
| ---                                                                                                                                  | ---                             |
| [terraform-pipeline.yml](https://github.com/Raihan11x/web-api-test/blob/master/.github/workflows/terraform-pipeline.yml) | <code>► Pipeline</code> |

</details>

<details closed><summary>modules.dbase</summary>

| File                                                                                                         | Summary                         |
| ---                                                                                                          | ---                             |
| [outputs.tf](https://github.com/Raihan11x/web-api-test/blob/master/modules/dbase/outputs.tf)     | <code>► Database Modules Outputs</code> |
| [main.tf](https://github.com/Raihan11x/web-api-test/blob/master/modules/dbase/main.tf)           | <code>► Database Modules Main</code> |
| [variables.tf](https://github.com/Raihan11x/web-api-test/blob/master/modules/dbase/variables.tf) | <code>► Database Modules Variables</code> |

</details>

<details closed><summary>modules.network</summary>

| File                                                                                                           | Summary                         |
| ---                                                                                                            | ---                             |
| [outputs.tf](https://github.com/Raihan11x/web-api-test/blob/master/modules/network/outputs.tf)     | <code>► Network Modules Outputs</code> |
| [main.tf](https://github.com/Raihan11x/web-api-test/blob/master/modules/network/main.tf)           | <code>► Network Modules Main</code> |
| [variables.tf](https://github.com/Raihan11x/web-api-test/blob/master/modules/network/variables.tf) | <code>► Network Modules Variables</code> |

</details>

<details closed><summary>modules.application</summary>

| File                                                                                                               | Summary                         |
| ---                                                                                                                | ---                             |
| [outputs.tf](https://github.com/Raihan11x/web-api-test/blob/master/modules/application/outputs.tf)     | <code>► Application Module Outputs</code> |
| [main.tf](https://github.com/Raihan11x/web-api-test/blob/master/modules/application/main.tf)           | <code>► Application Module Main</code> |
| [variables.tf](https://github.com/Raihan11x/web-api-test/blob/master/modules/application/variables.tf) | <code>► Application Module Variables</code> |

</details>

---

##  Getting Started

***Requirements***

Ensure you have the following dependencies installed on your system:

* **Terraform**: `version x.y.z`

###  Installation

1. Clone the web-api-test repository:

```sh
git clone https://github.com/Raihan11x/web-api-test
```

2. Change to the project directory:

```sh
cd web-api-test
```

3. Install the dependencies:

```sh
terraform init
```

###  Running `web-api-test`

Use the following command to run web-api-test locally:

```sh
terraform plan --var-file=<<insert tfvars file for env>>
```

NOTE: This will show you what changes will occur without applying these changes

---

## Pipeline

Modify components fo the pipeline to your needs, an example would be the name down below, you can change this to whatever suits your project.

```sh
name: Terraform Pipeline
```
can also include more steps if so desired, here is how that would look:

```sh
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
```

##  Contributing

Contributions are welcome! Here are several ways you can contribute:

- **[Submit Pull Requests](https://github.com/Raihan11x/web-api-test/blob/main/CONTRIBUTING.md)**: Review open PRs, and submit your own PRs.
- **[Join the Discussions](https://github.com/Raihan11x/web-api-test/discussions)**: Share your insights, provide feedback, or ask questions.
- **[Report Issues](https://github.com/Raihan11x/web-api-test/issues)**: Submit bugs found or log feature requests for the `web-api-test` project.

<details closed>
    <summary>Contributing Guidelines</summary>

1. **Fork the Repository**: Start by forking the project repository to your github account.
2. **Clone Locally**: Clone the forked repository to your local machine using a git client.
   ```sh
   git clone https://github.com/Raihan11x/web-api-test
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to GitHub**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.

Once your PR is reviewed and approved, it will be merged into the main branch.

</details>

---

##  Future improvements

List of future improvements that can be made to project over time:

1. **Authentication**: Create an appropriate IAM role with the minimum required permissions developers need to create out daily work for them to assume. Consider using STS assume role if multiple AWS accounts used for different envs.
2. **Hosting**: Create one global AWS hosted zone and route 53 records for different environments assigning nameservers correctly.
3. **Account structure**: For testing purposes the different environments currently exist in the same AWS account. Consider using a multiple AWS account strategy in production for better isolation of environments. Security first principles allowing better ACL policies and billing isolation.
4. **Web api**: Create Dockerfile in order to build the correct web api image and implement into pipeline.
5. **Database perms**: Create read roles for the relevant users/teams. Have a granualar approach to authenticating to different databases with different usernames/passwords.
6. **Security first**: Expand on the security first approach when developing infrastructure e.g utilising Service Control Policies at the org level and AWS WAF.
7. **Cost optimisation**: Utilise the default tagging at provider level in order to tag and effectively track cost usage of your resources. AWS cost explorer
