resource "aws_key_pair" "main" {
  key_name   = "ubuntu-key"
  public_key = file("~/.ssh/ubuntu-key.pub")
}
