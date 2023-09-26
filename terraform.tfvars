# Example EKS cluster from https://github.com/cloudposse/terraform-aws-eks-cluster/tree/2.9.0/examples/complete

region = "us-east-1"

availability_zones = ["us-east-1a", "us-east-1b"]

namespace = "app"

stage = "test"

name = "eks"

# oidc_provider_enabled is required to be true for VPC CNI addon
oidc_provider_enabled = true

enabled_cluster_log_types = ["audit"]

cluster_log_retention_period = 7

instance_types = ["t3.small"]

desired_size = 1

max_size = 3

min_size = 1

kubernetes_labels = {}

cluster_encryption_config_enabled = true

# When updating the Kubernetes version, also update the API and client-go version in test/src/go.mod
kubernetes_version = "1.26"

map_additional_iam_users = [{
  groups   = ["system:masters"]
  userarn  = "arn:aws:iam::976809625379:user/admin"
  username = "admin"
  },
  {
    groups   = ["system:masters"]
    userarn  = "arn:aws:iam::976809625379:user/root"
    username = "root"
}]

addons = [
  // https://docs.aws.amazon.com/eks/latest/userguide/managing-vpc-cni.html#vpc-cni-latest-available-version
  {
    addon_name               = "vpc-cni"
    addon_version            = null
    resolve_conflicts        = "NONE"
    service_account_role_arn = null
  },
  // https://docs.aws.amazon.com/eks/latest/userguide/managing-kube-proxy.html
  {
    addon_name               = "kube-proxy"
    addon_version            = null
    resolve_conflicts        = "NONE"
    service_account_role_arn = null
  },
  // https://docs.aws.amazon.com/eks/latest/userguide/managing-coredns.html
  {
    addon_name               = "coredns"
    addon_version            = null
    resolve_conflicts        = "NONE"
    service_account_role_arn = null
  },
]
