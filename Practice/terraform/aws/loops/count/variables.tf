variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f" # This is our devops-practice AMI RHEL 9 ID
}

variable "instance_type" {
  default = "t3.micro"
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

variable "common_tags" {
    type = map(string)
    default = {
      project = "expense"
      environment= "dev"
    }
  
}

variable "env" {
  default = "dev"

}
variable "instances" {
    type = list(string)
    default = [ "frontend", "backend", "DB" ]
  
}
variable "zone_id" {
    type = string
    default = "Z03128223E3YMCTAWVCQ9"
  
}
variable "domain_name" {
    type = string
    default = "kumardevops.store"
}

/*
variables preferences
1) Command line  -> -var <varname>=<varvalue>
2) tfvars
3) env var -> export TF_VAR_<varname> = <varvalue>
4) default values declared in var files
5) user prompt
*/