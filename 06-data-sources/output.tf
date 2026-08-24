output "amazon_linux_ami_id" {
  value = "This is Amazon Linux AMI ID: ${data.aws_ami.amazon_linux.id}"

}

output "redhat_practice_ami_id" {
  value = "This is Red Hat Practice AMI ID: ${data.aws_ami.redhat_practice.id}"
}