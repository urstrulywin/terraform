resource "aws_instance" "ec2" {
  for_each = var.instance_names
  ami           = var.ami_id 
  instance_type = each.value

  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "r53-record" {
  for_each = aws_instance.ec2
  zone_id = var.zone_id
  name    = each.key == "frontend" ? "${var.domain_name}" : "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [each.key == "frontend" ? each.value.public_ip : each.value.private_ip ]

  allow_overwrite = true # updates the record if it already exists, otherwise it will create a new record
  # if the record is updated, it will be updated but it is not managed by terraform, so it will be deleted if the record is deleted from terraform
}