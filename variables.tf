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