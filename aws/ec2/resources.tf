resource "aws_instance" "my-ec2-instance" {
  # utilize the 'count' parameter to create an array of resources
  count                       = var.node_count 
  
  # use the 'element' function to iterate through the var.azs list to retrieve a different availability zone value each time
  # will wrap around if 'count' exceeds the number of list items
  availability_zone           = element(var.azs, count.index)

  # utilize the 'length' function to return the number of items in the array then retrieve a single value from the list via 'element'
  private_ip				          = length(var.private_ips) > 0 ? element(var.private_ips, count.index) : var.private_ip
  
  associate_public_ip_address = var.public_ip  
  subnet_id					          = var.aws_subnet_id  
  ami                         = var.machine_ami
  instance_type               = var.aws_instance_type
  vpc_security_group_ids      = [aws_security_group.my-sg-group.id]
  key_name                    = var.key_name
  user_data         	        = templatefile("${path.module}/bootstrap-${var.os_distro}.${var.file_ext}", {access_port = var.access_port, service_port1 = var.service_port1, docker_api_port = var.docker_api_port})
  monitoring                  = false
  ebs_optimized               = false

  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    delete_on_termination = true
  }

  tags = {
    Name		    = "${var.app}-${var.environment}-0${count.index + 1}"
    owner       = var.owner
    environment = var.environment
    app         = "${var.app}-${var.environment}"
  }
}

resource "aws_key_pair" "my-aws-keys" {
  key_name      = var.key_name
  public_key    = var.public_key

  tags = {
    owner       = var.owner
    environment = var.environment
    app         = "${var.app}.${var.environment}"
    }
}

resource "aws_security_group" "my-sg-group" {
  name = var.security_group_name

  tags = {
    owner       = var.owner
    environment = var.environment
    app         = "${var.app}.${var.environment}"
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
    cidr_blocks = ["92.238.177.233/32"]
  }

  ingress {
    from_port   = var.docker_api_port
    to_port     = var.docker_api_port
    protocol    = "tcp"
    cidr_blocks = ["92.238.177.233/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
