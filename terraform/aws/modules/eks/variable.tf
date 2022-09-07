
variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  default = "NS_cluster"
  type = string
}

variable cluster_sg_name {
  description = "Name of the EKS cluster Security Group"
  default = "nsC_security_group"
  type        = string
}

variable "eks_cluster_subnet_ids" {
  type = list(string)
  default = ["subnet-06067acf739f83df4", "subnet-0b96619b7cb8f060f", "subnet-069f0aa79c28654fb", "subnet-065677af2b472b41b"]
  description = "List of subnet IDs. Must be in at least two different availability zones. Amazon EKS creates cross-account elastic network interfaces in these subnets to allow communication between your worker nodes and the Kubernetes control plane."
}

variable "endpoint_private_access" {
  type = bool
  default = true
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
}

variable "endpoint_public_access" {
  type = bool
  default = false
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
}

variable vpc_id {
  description = "VPC ID from which belongs the subnets"
  default     = "vpc-0716d07ac79150cc1"
  type        = string
  
  
}
