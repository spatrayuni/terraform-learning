provider "aws" {
  region = "us-west-2"
  profile = "learning"
}

resource "aws_instance" "Deepu-Bastion" {
  ami = "ami-0d53ab604830478ff"
  instance_type = "t2.micro"
  key_name = "spatrayuni4"
  vpc_security_group_ids = ["sg-01cd8fa17d41d4481"]
  subnet_id = "subnet-09b74995027eab3a3"
  associate_public_ip_address = true

  tags = {
    Name = "Deepu-Bastion"
  }
}
