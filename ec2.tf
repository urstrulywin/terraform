resource "aws_instance" "vm" {
  ami = var.ami_id
  instance_type = var.instance_type

  // Optional: Add tags to the instance
    tags = {
        Name = "Terraform-EC2-Instance"
    }
}