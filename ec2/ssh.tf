resource "tls_private_key" "main" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "main" {
  key_name   = "${var.project}-${var.env}-ssh"
  public_key = tls_private_key.main.public_key_openssh

  depends_on = [
    tls_private_key.main
  ]
}

resource "local_file" "main" {
  content         = tls_private_key.main.private_key_pem
  filename        = "./main.pem"
  file_permission = 600

  depends_on = [
    tls_private_key.main
  ]
}
