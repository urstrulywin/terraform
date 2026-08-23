# Terraform uses the following order of precedence:
# 1. Any -var and -var-file options on the command line in the order provided and variables from HCP Terraform
# 2. Any *.auto.tfvars or *.auto.tfvars.json files in lexical order
# 3. The terraform.tfvars.json file
# 4. The terraform.tfvars file
# 5. Environment variables
# 6. The default argument of the variable block

variable "sg-name" {
  default = "terraform-sg-all"
}

variable "instance_names" {
  type = list(string)
  default = [ "mongodb", "catalogue", "frontend"
    # "redis", "mysql", "rabbitmq", "user", "cart", "shipping", "payment", "dispatch",
    ]
}

variable "ami_id" {
    type = string
  default = "ami-0220d79f3f480ecf5"
}

variable "zone_id" {
  default = "Z08956962QNCVIB5UOVAS"
}

variable "domain_name" {
  default = "cadb.online"
}
