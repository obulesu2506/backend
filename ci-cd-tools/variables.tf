# variable "instances" {
#     type = list(string)
#     default = [ "Master", "AGENT" ]

# }

variable "zone_name" {
  type        = string
  default     = "kumardevops.store"
  description = "automation for Jenkins"

}
variable "project" {
  default = "expense"

}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    project     = "expense"
    environment = "dev"
    terraform   = "true"
  }
}

variable "zone_id" {
  type    = string
  default = "Z03128223E3YMCTAWVCQ9"

}