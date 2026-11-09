terraform {
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0"
}
