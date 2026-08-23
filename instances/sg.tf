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