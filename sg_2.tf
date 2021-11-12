variable "webservice_ports_web" {
  type    = list(number)
  default = [80, 443]
}

resource "aws_security_group" "tf_sg_2" {
  name = "webservice"

  dynamic "ingress" {
    for_each = var.webservice_ports_web
    iterator = port
    content {
      description = "webserviceports"
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
