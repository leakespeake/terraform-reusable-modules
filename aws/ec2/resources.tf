resource "aws_instance" "my-ec2-instance" {
  count                       = var.node_count
  availability_zone           = element(var.azs, count.index)
  subnet_id					  = var.aws_subnet_id
  private_ip				  = length(var.private_ips) > 0 ? element(var.private_ips, count.index) : var.private_ip
  ami                         = var.machine_ami
  instance_type               = var.aws_instance_type
  vpc_security_group_ids      = [aws_security_group.my-sg-group.id]
  key_name                    = var.key_name
  
 #user_data                   = data.template_file.user_data_centos.rendered			# bootstrap-centos.sh
 #user_data                   = data.template_file.user_data_coreos.rendered			# bootstrap-coreos.sh
  user_data                   = data.template_file.user_data_ubuntu.rendered			# bootstrap-ubuntu.sh
  
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
    from_port   = var.service_port1
    to_port     = var.service_port1
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
