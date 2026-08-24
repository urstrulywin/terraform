resource "aws_instance" "ec2" {
    count = 3
    ami = var.ami_id
    instance_type = "t3.micro"
    tags = {
        Name = var.instance_names[count.index]
        Project = "roboshop"
        Environment = "dev"
    }
}