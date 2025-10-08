provider "aws" {
  region = "eu-central-1"
}

variable "aws_instance_type" {
    description = "wert des instance typen"
    type = string
    default = "t2.micro"
}

resource "aws_instance" "erste_instanz" {
  count = 5
  instance_type = var.aws_instance_type
  ami = "ami-0a116fa7c861dd5f9"
  tags = {
    Name = "meine super coole instanz"
  }
}


output "public_ip" {
    description = "Hier findet sich der Wert der Public IP der ersten Instanz"
    value = aws_instance.erste_instanz.*.public_ip
}