resource "aws_eks_node_group" "default" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.node_desired_size
    max_size     = var.node_max_size
    min_size     = var.node_min_size
  }

  instance_types = var.node_instance_types

  disk_size = var.node_disk_size

  remote_access {
    ec2_ssh_key = var.node_ssh_key
  }

  tags = {
    Name        = "${var.cluster_name}-node-group"
    Environment = var.environment
  }
}
