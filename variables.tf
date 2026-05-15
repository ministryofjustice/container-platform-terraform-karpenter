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

variable "k8s_version" {
    default = ""
    description = "The Kubernetes version of the cluster, e.g. 1.35"
    type = string
}

variable "max_pods_per_node" {
  default     = 110
  description = "Maximum number of pods that will be allowed to run on a node"
  type        = number
}