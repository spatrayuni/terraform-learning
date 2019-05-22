provider "aws" {
  region = "us-west-2"
  profile = "learning"
}

resource "aws_instance" "Deepu-Web1" {
  ami = "ami-0d53ab604830478ff"
  instance_type = "t2.micro"
  key_name = "spatrayuni4"
  vpc_security_group_ids = ["${aws_security_group.Deepu-Web1-SG.id}"]
  subnet_id = "subnet-0585099563414ac77"

  user_data = <<-EOF
              #!/bin/bash
              yum install httpd -y
              echo "Hello Santhosh!" > /var/www/html/index.html
              service httpd start
              EOF

  tags = {
    Name = "Deepu-Web1"
  }
}

resource "aws_security_group" "Deepu-Web1-SG" {
  name = "Deepu-Web1-SG"
  description = "Deepu-Web1-SG"

  ingress {
    cidr_blocks = ["106.51.19.0/24", "103.15.250.0/24"]
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = ["sg-01cd8fa17d41d4481"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["106.51.19.0/24", "103.15.250.0/24"]
    security_groups = ["sg-01cd8fa17d41d4481"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Deepu-Web1-SG"
  }

  vpc_id = "vpc-0a3882b66ee62e86d"
}
