resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon-linux-2-ami.id
  instance_type = "t2.micro"

  subnet_id       = var.subnet_id
  security_groups = [aws_security_group.ec2.id]

  tags = {
    Name = "test"
  }
}

resource "aws_security_group" "ec2" {
  name        = "test-sg"
  description = "sg for ec2"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
    "0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
    "0.0.0.0/0"]
  }
}