variable "webservice_ports_ssh" {
  type    = list(number)
  default = [22]
}

resource "aws_security_group" "tf_sg_1" {
  name = "ssh inbound"

  dynamic "ingress" {
    for_each = var.webservice_ports_ssh
    iterator = port
    content {
      description = "ssh port"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
