provider "aws" {
  region = "us-west-2"
  profile = "learning"
}

resource "aws_instance" "Deepu-Ec2" {
  ami = "ami-0d53ab604830478ff"
  instance_type = "t2.micro"
  key_name = "spatrayuni4"
  subnet_id = "subnet-0585099563414ac77"
  vpc_security_group_ids = ["sg-01cd8fa17d41d4481"]
  tags = {
    Name = "Deepu-Ec2"
  }
}
