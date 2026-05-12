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
