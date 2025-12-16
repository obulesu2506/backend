resource "aws_instance" "this" {
  ami                    = "ami-09c813fb71547fc4f" # This is our devops-practice AMI ID
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = "t3.micro"

  tags = {
    Name     = "terraform-demo"
    practice = "terraform-practice"
  }
}

resource "aws_security_group" "allow_tls" {

  name        = "allow_tls"
  description = "Allow inbound and all outbound rules"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #mean TCP only
    cidr_blocks = ["0.0.0.0/0"]
  }
}