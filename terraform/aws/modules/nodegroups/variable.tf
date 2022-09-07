#Variables for EKS Nodegroup Resources

variable "node_group_name" {
  description = "Name of the Node Group"
  default     = "Ns-node-group"
  type        = string
}

variable "cluster_name" {
  description = "Name of the Cluster"
  type        = string
}

variable "source_security_group_id" {
  description = "source security group id"
  type        = string
}

variable vpc_id {
  description = "VPC ID from which belongs the subnets"
  default     = "vpc-0716d07ac79150cc1"
  type        = string 
}

variable "private_subnet_ids" {
  type        = list(string)
  default     = ["subnet-06067acf739f83df4", "subnet-0b96619b7cb8f060f"]
  description = "List of private subnet IDs."
}

variable "public_subnet_ids" {
  type        = list(string)
  default     = ["subnet-069f0aa79c28654fb", "subnet-065677af2b472b41b"]
  description = "List of public subnet IDs."
}

variable "ami_type" {
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Defaults to AL2_x86_64. Valid values: AL2_x86_64, AL2_x86_64_GPU."
  type        = string 
  default     = "AL2_x86_64"
}

variable "disk_size" {
  description = "Disk size in GiB for worker nodes. Defaults to 20."
  type        = number
  default     = 20
}

variable "instance_types" {
  type        = list(string)
  default     = ["t3.medium"]
  description = "Set of instance types associated with the EKS Node Group."
}

variable "pvt_desired_size" {
  description = "Desired number of worker nodes in private subnet"
  default     = 2
  type        = number
}

variable "pvt_max_size" {
  description = "Maximum number of worker nodes in private subnet."
  default     = 2
  type        = number
}

variable "pvt_min_size" {
  description = "Minimum number of worker nodes in private subnet."
  default     = 2
  type = number
}

/*
variable "pblc_desired_size" {
  description = "Desired number of worker nodes in public subnet"
  default = 1
  type = number
}

variable "pblc_max_size" {
  description = "Maximum number of worker nodes in public subnet."
  default = 1
  type = number
}

variable "pblc_min_size" {
  description = "Minimum number of worker nodes in public subnet."
  default = 1
  type = number
}
*/

variable "nodes_sg_name" {
  description = "Name of the EKS node group Security Group"
  default = "new_node_group_security"
  type        = string
}


