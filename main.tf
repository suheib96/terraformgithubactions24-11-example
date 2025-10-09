provider "aws" {
  region = "eu-central-1"
}

variable "aws_instance_type" {
    description = "wert des instance typen"
    type = string
    default = "t2.micro"
}

resource "aws_security_group" "sg-frontend" {
  name = "securitygroup_from_tf"

  vpc_id = "vpc-0e69cf4346ac204e3"

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}                    

resource "aws_instance" "erste_instanz" {
  instance_type = var.aws_instance_type
  ami = "ami-0a116fa7c861dd5f9"
  key_name = "ssh-demokey"
  tags = {
    Name = "meine super coole instanz"
  }

  vpc_security_group_ids = [
    aws_security_group.sg-frontend.id
  ]
}

output "public_ip" {
    description = "Hier findet sich der Wert der Public IP der ersten Instanz"
    value = aws_instance.erste_instanz.*.public_ip
}