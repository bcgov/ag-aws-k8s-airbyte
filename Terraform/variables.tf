# variable "eks_admin_iam_arns" {
#   description = "List of IAM ARNs to grant admin access"
#   type        = list(string)
# }

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "environment" {
  description = "Environment name (dev/test/prod)"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where EKS control plane and nodes will be deployed"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the cluster will be deployed"
  type        = string
}

variable "node_desired_size" {
  description = "Desired number of nodes"
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum number of nodes"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of nodes"
  type        = number
  default     = 3
}

variable "node_instance_types" {
  description = "EC2 instance types for the node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_disk_size" {
  description = "Disk size in GiB for worker nodes"
  type        = number
  default     = 20
}

variable "node_ssh_key" {
  description = "SSH key pair name to enable SSH access to the nodes"
  type        = string
}

variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default = ""
}

variable "node_role_arn" {
  description = "IAM Role ARN for the node group"
  type        = string
}

variable "db_name" {
  description = "Name of the initial database to create"
  type        = string
  default     = ""
}

variable "db_username" {
  description = "Master username for the RDS instance"
  type        = string
  default     = ""
}

variable "db_password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = ""
}

variable "db_allocated_storage" {
  description = "Allocated storage (GB)"
  type        = number
  default     = 20
}

variable "db_engine_version" {
  description = "Postgres engine version"
  type        = string
  default     = " "
}

