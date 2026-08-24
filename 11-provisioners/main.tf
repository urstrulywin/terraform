resource "aws_instance" "ec2" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  security_groups = [aws_security_group.provisioner-sg.name]

  tags = {
    Name = "provisioner"
  }

  provisioner "local-exec" {
    command = "echo Instance is created with private IP: ${self.private_ip} and public IP: ${self.public_ip}"
  }
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> inventory.ini"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo Instance is going to be destroyed"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo > inventory.ini"
  }

  connection {
    type      = "ssh"
    user      = "ec2-user"
    password  = "DevOps321"
    host      = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      # "sudo dnf update -y",
      "sudo dnf install -y nginx", 
      "sudo systemctl start nginx", 
      "sudo systemctl enable nginx" 

    ]    
  }
  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo systemctl stop nginx"
    ]
  }
}

resource "aws_security_group" "provisioner-sg" { 
    name = "provisioner-sg"
    ingress { 
        description      = "Allow All ports"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "provisioner-sg"
    }
}