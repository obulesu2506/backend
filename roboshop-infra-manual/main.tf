resource "aws_instance" "roboshop" {
    for_each = each.instances
    ami = data.aws_ami.joindevops.id
    vpc_security_group_ids = [var.allow_all]
    instance_type = each.value
    tags = {
      Name = each.key
    }
  
}
resource "aws_route53_record" "www" {
    for_each = aws_instance.roboshop
    zone_id = var.zone_id
    name = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
    allow_overwrite = true

}