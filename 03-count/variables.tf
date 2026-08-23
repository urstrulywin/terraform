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