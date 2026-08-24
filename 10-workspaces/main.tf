resource "aws_instance" "ec2" {
  for_each = var.instance_names
  ami           = data.aws_ami.redhat_practice.id 
  instance_type = each.value

  tags = {
    Name = each.key
  }
}
