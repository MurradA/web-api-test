<p align="center">
    <h1 align="center">web-api-test</h1>
</p>
<hr>

##  Overview

<code>► README instructing deployment of application to AWS ECS using terraform and Github actions </code>

---

##  Repository Structure

```sh
└── web-api-test/murrad-tech-test
    ├── workflows
    │   └── terraform-pipeline.yml
    ├── README.md
    ├── main.tf
    ├── dev
    │   └── dev.tfvars
    ├── staging
    │   └── staging.tfvars
    ├── prod
    │   └── prod.tfvars
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
| [main.tf](https://github.com/MurradA/web-api-test/blob/main/murrad-tech-test/main.tf)           | <code>► Main Configuration to call modules</code> |
| [variables.tf](https://github.com/MurradA/web-api-test/blob/main/murrad-tech-test/variables.tf) | <code>► variables</code> |

</details>

<details closed><summary>.github.workflows</summary>

| File                                                                                                                                 | Summary                         |
| ---                                                                                                                                  | ---                             |
| [terraform-pipeline.yml](https://github.com/MurradA/web-api-test/blob/main/murrad-tech-test/workflows/terraform-pipeline.yml) | <code>► Pipeline</code> |

</details>

<details closed><summary>modules.rds</summary>

| File                                                                                                         | Summary                         |
| ---                                                                                                          | ---                             |
| [outputs.tf](https://github.com/MurradA/web-api-test/blob/main/murrad-tech-test/modules/rds/outputs.tf)     | <code>► Database Modules Outputs</code> |
| [main.tf](https://github.com/MurradA/web-api-test/blob/main/murrad-tech-test/modules/rds/main.tf)           | <code>► Database Modules Main</code> |
| [variables.tf](https://github.com/MurradA/web-api-test/blob/main/murrad-tech-test/modules/rds/variables.tf) | <code>► Database Modules Variables</code> |

</details>

<details closed><summary>modules.network</summary>

| File                                                                                                           | Summary                         |
| ---                                                                                                            | ---                             |
| [outputs.tf](https://github.com/MurradA/web-api-test/blob/main/murrad-tech-test/modules/vpc/outputs.tf)     | <code>► Network Modules Outputs</code> |
| [main.tf](https://github.com/MurradA/web-api-test/blob/main/murrad-tech-test/modules/vpc/main.tf)           | <code>► Network Modules Main</code> |
| [variables.tf](https://github.com/MurradA/web-api-test/blob/main/murrad-tech-test/modules/vpc/variables.tf) | <code>► Network Modules Variables</code> |

</details>

<details closed><summary>modules.application</summary>

| File                                                                                                               | Summary                         |
| ---                                                                                                                | ---                             |
| [outputs.tf](https://github.com/MurradA/web-api-test/blob/main/murrad-tech-test/modules/ecs/outputs.tf)     | <code>► Application Module Outputs</code> |
| [main.tf](https://github.com/MurradA/web-api-test/blob/main/murrad-tech-test/modules/ecs/main.tf)           | <code>► Application Module Main</code> |
| [variables.tf](https://github.com/MurradA/web-api-test/blob/main/murrad-tech-test/modules/ecs/variables.tf) | <code>► Application Module Variables</code> |

</details>

---

##  Getting Started

***Requirements***

Ensure you have the following dependencies installed on your system:

* **Terraform**: `version x.y.z`

###  Installation

1. Clone the web-api-test repository:

```sh
git clone https://github.com/MurradA/web-api-test
```

2. Change to the project directory:

```sh
cd web-api-test/murrad-tech-test
```

3. Initialise your working directory containing terraform configuration files using the command below. This will install your plugins, modules and download the dependencies:

```sh
terraform init
```

###  Validating and testing:

Despite having certain criteria for testing/linting in your terraform pipeline, it is good practice to test that a certain formating and validation standard has been met from your configuration files:

1. Run Terraform format in order to ensure that all your configuration files within your working directory have been written following terraforms standard

```sh
terraform fmt --recursive
```

2. Run terraform validate to check the syntax and structure of your Terraform configuration files, ensuring they are valid and free of errors.

```sh
terraform validate
```

###  Running `web-api-test`

Use the following command to run web-api-test locally:

```sh
terraform plan --var-file=<<insert tfvars file for env>>
```

NOTE: This will compare your existent state to your desired state using the terraform state file hence showing what changes could occur

---

##  Contributing

Contributions are welcome! Here are several ways you can contribute:

- **[Submit Pull Requests](https://github.com/MurradA/web-api-test/blob/main/CONTRIBUTING.md)**: Review open PRs, and submit your own PRs.
- **[Join the Discussions](https://github.com/MurradA/web-api-test/murrad-tech-test/discussions)**: Share your insights, provide feedback, or ask questions.
- **[Report Issues](https://github.com/MurradA/web-api-test/murrad-tech-test/issues)**: Submit bugs found or log feature requests for the `web-api-test` project.

<details closed>
    <summary>Contributing Guidelines</summary>

1. **Begin by Forking the Repository**: Initial step required is to fork the repository to your github account.
2. **Clone repository**: Execute the command below in order to clone the repository locally using a git client.
   ```sh
   git clone https://github.com/MurradA/web-api-test
   ```
3. **Branching strategy**: It is always best practice to create a new branch giving it a descriptive name relevant to the task.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Select changes you wish to add**: Add the changes of the files you wish to deploy.
   ```sh
   git add <<file-name>>
   ```
5. **Commit Your Changes**: Commit with a clear message describing your updates. It is best practice to construct a commit message in an imperative mood e.g 'fix typo' rather than 'fixed typo'
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push changes to GitHub**: Push the changes that you have made to the forked GitHub repo.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository that clearly describes the changes that you have made. It is best practice to wait for your PR to be reviewed and approved before merging into the main branch.
Make sure to test the existing changes to ensure that the pipeline still successful runs and your changes should not break anything.

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
