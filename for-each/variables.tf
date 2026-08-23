variable "sg-name" {
  default = "terraform-sg-all"
}

variable "instance_names" {
  type = map
  default = {
    mongodb = "t3.small"
    redis = "t3.micro"
    mysql = "t3.small"
    rabbitmq = "t3.micro"
    catalogue = "t3.micro"
    cart = "t3.micro"
    user = "t3.micro"
    shipping = "t3.small"
    payment = "t3.micro"
    dispatch = "t3.micro"
    web = "t3.micro"
  }
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
