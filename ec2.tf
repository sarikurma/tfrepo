resource "aws_instance" "myec2" {
  ami                    = "ami-073998ba87e205747"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.tf_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.tf_sg_1.id, aws_security_group.tf_sg_2.id]

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("C:\\Users\\GNLN\\00_others\\00_keys\\pubkey-gari-test.pem")
    }
  }
}
