module "karpenter" {
  source = "terraform-aws-modules/eks/aws//modules/karpenter"

  cluster_name = var.cluster_name

  # Name needs to match role name passed to the EC2NodeClass
  node_iam_role_use_name_prefix   = false
  node_iam_role_name              = var.cluster_name
  create_pod_identity_association = true

  # Used to attach additional IAM policies to the Karpenter node IAM role
  node_iam_role_additional_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }
}


resource "helm_release" "karpenter" {
  namespace  = "kube-system"
  name       = "karpenter"
  repository = "oci://public.ecr.aws/karpenter"
  chart      = "karpenter"
  version    = "1.9.0"
  wait       = false

  values = [
    <<-EOT
   nodeSelector:
     cloud-platform.justice.gov.uk/system-ng: 'true'
   tolerations:
     - key: system-node
       operator: Equal
       value: "true"
       effect: NoSchedule
   dnsPolicy: Default
   settings:
     clusterName: ${var.cluster_name}
     clusterEndpoint: ${var.cluster_endpoint}
     interruptionQueue: ${module.karpenter.queue_name}
   webhook:
     enabled: false
   EOT
  ]
  depends_on = [
    module.karpenter
  ]
}


data "kubectl_path_documents" "manifests" {
  pattern = "${path.module}/templates/karpenter.yaml"
  vars = {
    alias_version = "v20260304"
    cluster_name  = var.cluster_name
  }
}

resource "kubectl_manifest" "deploy_manifest" {
  for_each  = data.kubectl_path_documents.manifests.manifests
  yaml_body = each.value

  depends_on = [
    helm_release.karpenter
  ]
}