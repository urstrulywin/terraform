resource "aws_instance" "ec2" {
  count = length(var.instance_names)
  ami           = var.ami_id 
  
  instance_type = local.instance_type[var.instance_names[count.index]] # count.index is a special variable given by terraform
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

resource "aws_security_group" "terraform-sg" { 
    # "terraform-sg" is the name of the security group in Terraform, it can be anything, but it should be unique within the module
    
    name = var.sg-name
    # this is the name of the security group in AWS

    ingress { # ingress is for incoming traffic, egress is for outgoing traffic
        description      = "Allow All ports"
        from_port        = 0 # 0 means all ports
        to_port          = 0
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        #ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "terraform-sg"
    }
}