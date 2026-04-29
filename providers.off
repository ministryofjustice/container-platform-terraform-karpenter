provider "kubernetes" {
  host                   = var.provider_endpoint
  cluster_ca_certificate = var.provider_cluster_ca_certificate
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = try(["eks", "get-token", "--cluster-name", var.provider_cluster_name], null)
    command     = "aws"
  }
}

provider "helm" {
  kubernetes = {
    host = var.cluster_endpoint
    cluster_ca_certificate = var.cluster_ca_certificate

    exec = {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args = try(["eks", "get-token", "--cluster-name", var.cluster_name], null)
    }
  }
}

provider "kubectl" {
  host = var.cluster_endpoint
  cluster_ca_certificate = var.cluster_ca_certificate
  token            = var.provider_token
  load_config_file = false
}
