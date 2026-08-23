resource "aws_instance" "ec2" {
    count = length(var.instance_names)
    ami = var.ami_id
    instance_type = contains(["mongodb", "mysql","shipping"], var.instance_names[count.index]) ? "t3.small" : "t3.micro"
    tags = {
        Name = var.instance_names[count.index]
        Project = "roboshop"
        Environment = "dev"
    }
}