variable "passed_location" {}

variable "passed_resource_group_name" {
  type    = string
}

variable "passed_prefix" {
  type    = string
  default = "my"
}

variable "passed_tags" {
  type = map

  default = {
    Environment = "Terraform Development"
    Dept        = "DevNoOps"
  }
}

variable "sku" {
  default = "Developer_1"
}

variable "publisher_name" {
  default = "Puneet Kankane"
}

variable "publisher_email" {
  default = "puneet.kankane@gmail.com"
}