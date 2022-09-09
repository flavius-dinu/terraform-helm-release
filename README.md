# Terraform Helm Release

## Workflows
In this template there are 3 github actions workflows:
- **auto_tag.yaml**
    - this workflow will run whenever a merge to the main branch occurs
    - it will by default tag your repository with a Patch bump (version format is: vMajor.Minor.Patch)
    - if you want to bump the major or the minor version of the repository, you will simply have to start your commit with #major or #minor
- **pre_commit.yaml**
    - this workflow will run on every push in order to check: tflint, tf-docs, validate, fmt, end-of-file fixer and trailing whitspace fixes and whatever else you decide to add to the .pre-commit-config.yaml file
- **terraform.yaml**
    - this workflow can be run manually based on an operation you provide (plan, apply, destroy)
    - it is recommended to use remote state in order to take advantage of this

## Installing pre-commit locally
In order to make sure that you are writing code that respects industry standards, you will need to install:
- [pre-commit](https://pre-commit.com)
- [tf-docs](https://github.com/terraform-docs/terraform-docs)
- [tflint](https://github.com/terraform-linters/tflint)

After you install all of these, you can go to the root directory of the repository and run:

`pre-commit run --all-files`

This will fix all the problems related to the hooks mentioned above.

## Module details

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.this](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_helm"></a> [helm](#input\_helm) | name                   = string<br>chart                  = string<br>repository             = string<br>version                = string<br>repository             = string<br>namespace              = string<br>create\_namespace       = bool<br>values                 = list(string)<br>set                    = list(object({<br>    name   = string<br>    value  = string<br>    type   = string<br>}))<br>set\_sensitive          = list(object({<br>    name   = string<br>    value  = string<br>    type   = string<br>})) | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_helm_metadata"></a> [helm\_metadata](#output\_helm\_metadata) | outputs |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
