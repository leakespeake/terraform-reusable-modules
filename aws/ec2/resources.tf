resource "aws_instance" "my-ec2-instance" {
  count                       = var.node_count
  availability_zone           = var.azs
  
  ami                         = var.machine_ami
  instance_type               = var.aws_instance_type
  vpc_security_group_ids      = [aws_security_group.my-sg-group.id]
  subnet_id                   = var.aws_subnet_id
  key_name                    = var.key_name
  user_data                   = var.user_data
  monitoring                  = false
  ebs_optimized               = false
  associate_public_ip_address = var.public_ip

  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    delete_on_termination = true
  }

  tags = {
    owner       = var.owner
    environment = var.environment
    App         = "${var.app}.${var.environment}"
    Name        = "${var.app}.${var.environment}${local.include_count_in_hostname ? format("%02d", count.index+var.node_start_number) : ""}"
  }
}

resource "aws_key_pair" "my-aws-keys" {
  key_name   = var.key_name
  public_key = var.public_key

  tags = {
    owner       = var.owner
    environment = var.environment
    App         = "${var.app}.${var.environment}"
    }
}

resource "aws_security_group" "my-sg-group" {
  name = var.security_group_name

  tags = {
    owner       = var.owner
    environment = var.environment
    App         = "${var.app}.${var.environment}"
    }

  ingress {
    from_port   = var.service_port
    to_port     = var.service_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.access_port
    to_port     = var.access_port
    protocol    = "tcp"
    cidr_blocks = ["92.238.177.185/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
