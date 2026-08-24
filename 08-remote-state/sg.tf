resource "aws_security_group" "remote-terraform-sg" { 
    name = "remote-terraform-sg"
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
        Name = "remote-terraform-sg"
    }
}