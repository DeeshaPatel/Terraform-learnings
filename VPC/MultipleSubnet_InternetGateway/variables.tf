variable "subnets" {
  type = list(any)
  default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]
}