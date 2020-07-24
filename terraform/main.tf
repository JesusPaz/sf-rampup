provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "jenkins-sg" {
  name        = "jenkins-sg-rampup"
  description = "Allow traffic port 8080"

  ingress {
    description = "TCP 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins SG RampUp"
  }
}

resource "aws_instance" "jenkins-ec2" {
  ami           = var.image_id
  instance_type = var.instance_type

  tags = {
    Name = "Jenkins RampUp"
  }

  vpc_security_group_ids = [
    aws_security_group.jenkins-sg.id
  ]

}
