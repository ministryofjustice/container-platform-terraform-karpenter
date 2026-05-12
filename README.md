# Container Platform Terraform Karpenter Module

[![Ministry of Justice Repository Compliance Badge](https://github-community.service.justice.gov.uk/repository-standards/api/container-platform-terraform-karpenter/badge)](https://github-community.service.justice.gov.uk/repository-standards/container-platform-terraform-karpenter)


[![Releases](https://img.shields.io/github/release/ministryofjustice/container-platform-terraform-karpenter/all.svg?style=flat-square)](https://github.com/ministryofjustice/container-platform-terraform-karpenter/releases)

This is the Karpenter terraform module for the Container Platform

## Usage


```hcl
module "karpenter" {
  source  = "github.com/ministryofjustice/container-platform-terraform-karpenter?ref=1.0.0"

  cluster_name = local.cluster_name
  cluster_endpoint = module.eks[0].cluster_endpoint
  k8s_version = local.environment_configuration.eks_cluster_version
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_external"></a> [external](#provider\_external) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | ~> 2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_karpenter"></a> [karpenter](#module\_karpenter) | terraform-aws-modules/eks/aws//modules/karpenter | n/a |

## Resources

| Name | Type |
|------|------|
| [helm_release.karpenter](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.deploy_manifest](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/manifest) | resource |
| [external_external.karpenter_alias_version](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_endpoint"></a> [cluster\_endpoint](#input\_cluster\_endpoint) | The API endpoint of the cluster | `string` | `""` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the container platform cluster, e.g. live, cp-xxxx-xxxx | `string` | `""` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | The Kubernetes version of the cluster, e.g. 1.35 | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->