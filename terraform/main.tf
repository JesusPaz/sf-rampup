resource "aws_instance" "jenkins-ec2" {
  ami           = "${var.image_id}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"
  vpc_security_group_ids = [
    "${aws_security_group.rampup_sg_jenkins.id}"
  ]

  tags = {
    Name = "Jenkins RampUp"
  }

}
