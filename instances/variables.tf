variable "sg-name" {
  default = "terraform-sg-all"
}

variable "instance_names" {
  type = list
  default = [ "mongodb", "redis", "catalogue", "user", "cart", "frontend"
    # "mysql", "rabbitmq", "shipping", "payment", "dispatch",
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

variable "isProd" {
  type = bool
  default = true
}
