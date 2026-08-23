# Variable Precedance:
# 1. Any -var and -var-file options on the command line in the order provided and variables from HCP Terraform (last mentioned will be considered as final)
# 2. terraform.tfvars file
# 3. environment variables
# 4. default value in the variable block

variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "RHEL9 joindevops image"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"

  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium", "t3.large"], var.instance_type)
    error_message = "Instance type should be either t3.micro or t3.small"
  }
}

variable "ec2_tags" {
  type = map
  default = {
    Name        = "ec2-terraform"
    Project     = "roboshop"
    Environment = "dev"
  }
}