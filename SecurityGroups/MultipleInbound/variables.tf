variable "multiple_ports" {
  type = map(any)
  default = {
    http  = { from = 80, to = 80 },
    https = { from = 443, to = 443 }
  }
}