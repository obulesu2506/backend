resource "aws_instance" "count-example" {
  #count                = 3
  count                  = length(var.instances)
  ami                    = var.ami_id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = var.env == "prod" ? "t3.micro" : "t3.nano"
  tags                   = merge(
    var.common_tags,
    {
        Name = var.instances[count.index]
    }
  )

}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls_1"
  description = "Allow TLS Inbound and all outbound traffic"

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

  tags = {
    Name = "allow_tls"
  }

}