resource "aws_instance" "ec2" {
  #count = 11 # count.index is a special variable given by terraform
  count = length(var.instance_names)
  ami           = var.ami_id 
  instance_type = local.instance_type[var.instance_names[count.index]]
  #local.instance_type is a map, so we can use the instance name to get the instance type
  security_groups = [aws_security_group.terraform-sg.name]
  tags = {
    Name = var.instance_names[count.index]
  }
}

resource "aws_route53_record" "r53-record" {
  #count = 11
  count = length(var.instance_names)
  zone_id = var.zone_id
  name    = local.records[var.instance_names[count.index]] #local.records is a map, so we can use the instance name to get the record name
  type    = "A"
  ttl     = 1
  records = [local.ip[var.instance_names[count.index]]] 
  #local.ip is a map, so we can use the instance name to get the ip address

  allow_overwrite = true # updates the record if it already exists, otherwise it will create a new record
  # if the record is updated, it will be updated but it is not managed by terraform, so it will be deleted if the record is deleted from terraform
}