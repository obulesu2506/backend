variable "instances" {
    type = map(string)
    default = {
      mongodb = "t3.small"
      reddis = "t3.micro"
      mysql = "t3.small"
      rabbitmq = "t3.micro"
      catalogue = "t3.micro"
      cart = "t3.micro"
      user = "t3.micro"
      shipping = "t3.small"
      dispatch = "t3.micro"
      frontend = "t3.micro"
    }
}
variable "zone_id" {
    type = string
    default = "Z03128223E3YMCTAWVCQ9"
}

variable "domain_name" {
    type = string
    default = "kumardevops.store"
}

variable "allow_all" {
    type = string
    default = "sg-04b43b659458be54a"
  
}