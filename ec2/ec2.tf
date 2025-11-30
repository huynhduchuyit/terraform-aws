resource "aws_instance" "main" {
  ami                    = "ami-0d13a05f25fc8747b"
  instance_type          = "t3a.small"
  key_name               = aws_key_pair.main.key_name
  vpc_security_group_ids = [aws_security_group.main.id]

  tags = {
    Name = "${var.project}-${var.env}-ec2"
  }

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
    iops        = 3000
    throughput  = 125

    tags = {
      Name = "${var.project}-${var.env}-ebs"
    }
  }

  depends_on = [
    aws_key_pair.main,
    aws_security_group.main
  ]
}
