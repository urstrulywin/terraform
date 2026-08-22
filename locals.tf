locals {
  instance_type = {
    for name in var.instance_names :
    name => contains(["mongodb", "mysql", "shipping"], name) ? "t3.small" : "t3.micro"
  }

  ip = {
    for name in var.instance_names :
    
    # we are using the ouput feature of terraform to get the ip address of the instance
    # terraform output is a list, so we need to use index to get the correct instance
    # aws_instance.ec2 is a list of all the ec2 instances
    name => (
      name == "frontend"
      ? aws_instance.ec2[index(var.instance_names, name)].public_ip
      : aws_instance.ec2[index(var.instance_names, name)].private_ip
    )
  }

  records = {
    for name in var.instance_names :
    name => (
      name == "frontend"
      ? "${var.domain_name}" # interpolation
      : "${name}.${var.domain_name}" 
    )
  }
}