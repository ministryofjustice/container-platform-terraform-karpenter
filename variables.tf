variable "cluster_name" {
    default = ""
    description = "The name of the container platform cluster, e.g. live, cp-xxxx-xxxx"
    type = string
}

variable "cluster_endpoint" {
  default = ""
  description = "The API endpoint of the cluster"
  type = string
}

variable "cluster_ca_certificate" {
  default = ""
  description = "The CA certificate of the cluster"
}

variable "provider_endpoint" {
  default = ""
  description = "The API endpoint of the cluster for the Kubernetes provider"
}

variable "provider_cluster_ca_certificate" {
  default = ""
  description = "The CA certificate of the cluster for the Kubernetes provider"
}

variable "provider_cluster_name" {
  default = ""
  description = "The name of the cluster for the Kubernetes provider"
}

variable "provider_token" {
  default = ""
  description = "The token for authenticating to the cluster for the Kubectl provider"
}