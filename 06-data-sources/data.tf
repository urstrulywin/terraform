data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["137112412989"] # Amazon
  tags = {
    Name   = "amazon-linux-via-terraform"
  }
  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-*"] # Filter for Amazon Linux 2023 AMIs
  }
}

data "aws_ami" "redhat_practice" {
  most_recent = true
  owners = ["973714476881"]
  tags = {
    Name   = "redhat-practice-via-terraform"
  }
  filter {
    name   = "name"
    values = ["Redhat*"]
  }
}
