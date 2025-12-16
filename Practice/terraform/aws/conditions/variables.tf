variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f" # This is our devops-practice AMI RHEL 9 ID
}

variable "instance_type" {
  default = "t3.micro" 
}
variable "ec2_tags" {
  type = map(string)
  default = {
    project     = "expense"
    component   = "backend"
    environment = "dev"
    Name        = "expense-backend-dev"
  }
}
variable "from_port" {
  type    = number
  default = 22
}
variable "to_port" {
  type    = number
  default = 22
}
variable "protocol" {
  type    = string
  default = "tcp"
}
variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
variable "sg_tags" {
  type = map(string)
  default = {
    Name = "expense-backend-dev"
  }
}

variable "env" {
    #default = "dev"
  
}
/*
variables preferences
1) Command line  -> -var <varname>=<varvalue>
2) tfvars
3) env var -> export TF_VAR_<varname> = <varvalue>
4) default values declared in var files
5) user prompt
*/