resource "aws_instance" "ec2" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
    tags = {
        Name = "ec2-instance"
        Project = "roboshop"
        Environment = "dev"
    }
}