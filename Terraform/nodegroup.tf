// nodegroup.tf

variable "cluster_name" {
  description = "Name of your EKS cluster"
  type        = string
}

variable "environment" {
  description = "dev/test/prod"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where nodes will live"
  type        = list(string)
}

variable "node_group_desired_capacity" {
  description = "Desired number of nodes"
  type        = number
  default     = 2
}

variable "node_group_min_capacity" {
  description = "Minimum number of nodes"
  type        = number
  default     = 1
}

variable "node_group_max_capacity" {
  description = "Maximum number of nodes"
  type        = number
  default     = 3
}

variable "node_instance_types" {
  description = "List of EC2 instance types for the nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

resource "aws_eks_node_group" "workers" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.cluster_name}-${var.environment}-ng"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.node_group_desired_capacity
    min_size     = var.node_group_min_capacity
    max_size     = var.node_group_max_capacity
  }

  instance_types = var.node_instance_types

  capacity_type = "ON_DEMAND"

  tags = {
    Name        = "${var.cluster_name}-${var.environment}-ng"
    Environment = var.environment
  }

  depends_on = [
    aws_eks_cluster.eks,            // adjust to your cluster resource name
    aws_iam_role_policy_attachment.eks_node_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_node_AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.eks_node_AmazonEKS_CNI_Policy,
  ]
}
