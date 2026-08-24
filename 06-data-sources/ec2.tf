resource "aws_instance" "ec2-data-source" {
    ami = data.aws_ami.redhat_practice
    instance_type = "t3.micro"
    tags = {
      name = "EC2-Data-Source"
    }
}