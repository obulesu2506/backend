resource "aws_instance" "variables-demo" {
  ami                    = var.ami_id #"ami-09c813fb71547fc4f" # This is our devops-practice AMI ID
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = var.instance_type #"t3.nano"

  tags = var.ec2_tags
  /*{
        Name = "Variables"
        description = "Terraform Variables Demo"
    }*/

}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls_1"
  description = "Allow inbound & all outbound traffic"

  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
  }

  tags = var.sg_tags
  /*{
      name = "allow_tls"
    }*/

}