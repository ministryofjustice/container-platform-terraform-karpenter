provider "aws" {
  region  = "eu-west-2"
}


module "example_cluster_autoscaler" {
  # source = "github.com/ministryofjustice/container-platform-terraform-karpenter?ref=1.0.0"
  source = "../"

  cluster_name = "cluster_name"
  cluster_endpoint = "cluster_endpoint"
  k8s_version = "1.35"
}

