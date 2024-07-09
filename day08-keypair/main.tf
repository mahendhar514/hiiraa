#lunching instance with local laptop keypair generated by ssh-keygen
resource "aws_key_pair" "key" {
    key_name = "localkey"
    public_key = file("~/.ssh/id_ed25519.pub")
}

#attaching keypair to the instance
resource "aws_instance" "keyinstance" {
    ami = "ami-01376101673c89611"
    instance_type = "t2.micro"
    key_name = aws_key_pair.key.key_name
    tags = {
      Name = "keypair-instance"
    }
}