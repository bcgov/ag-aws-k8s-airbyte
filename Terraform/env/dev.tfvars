# env/dev.tfvars

cluster_name            = "eks-dev"
environment             = "dev"
aws_region              = "ca-central-1"

# VPC & Subnets
vpc_id                  = "vpc-0d9ef253248db1cdc"
subnet_ids              = [
  "subnet-01646393668d6e5b0",  # Test-Data-A
  "subnet-046f8a6b447720e1b",  # Test-Mgmt-B
  "subnet-07437c00c7d78a6f5",  # Test-App-A
  "subnet-0791ccefd18b5047d",  # Test-App-B
]

# EKS Node Group
node_desired_size       = 2
node_min_size           = 1
node_max_size           = 3
node_instance_types     = ["m7i.large"]
# node_disk_size          = 20
node_ssh_key            = "your-ssh-keypair-name"
node_role_arn          = "arn:aws:iam::828865617457:role/eks-dev-eks-node-group-role"

# IAM Admins (must be a list of ARNs)
eks_admin_iam_arns      = "<place_holder_arn>"

# Remote State Backend
backend_bucket_name     = "f4cd18-dev-terraformstate"
backend_key             = "eks/dev/terraform.tfstate"      # if you use key as a var
dynamodb_table_name     = "terraform-lock-dev"             # if you made per-env lock tables

##### RDS config settings### 

db_password    = "yourSuperSecretPassword123!"
db_name = "dev-airbyte-rds"
db_username = "devusers"
db_instance_class = "db.t3.micro"
db_allocated_storage = 20
db_engine_version = "17.4"

