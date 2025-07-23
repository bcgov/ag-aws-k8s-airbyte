cluster_name = "eks-dev"
environment  = "dev"

vpc_id = "vpc-0d9ef253248db1cdc"

subnet_ids = [
  "subnet-01646393668d6e5b0",
  "subnet-046f8a6b447720e1b",
  "subnet-07437c00c7d78a6f5",
  "subnet-0791ccefd18b5047d"
]

node_desired_size   = 2
node_min_size       = 1
node_max_size       = 3
node_instance_types = ["t3.medium"]
node_disk_size      = 20
node_ssh_key        = "your-ssh-keypair-name"

aws_region = "ca-central-1"

eks_admin_iam_arns = "<place_holder_arn>"