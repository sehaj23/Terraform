provider "aws" {
  region     = "ap-southeast-2"
   
}

resource "aws_instance" "my_app_server" {
  ami           = "ami-09eebd0b9bd845bf1"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstanceTerraform"
  }
}

# resource "aws_vpc" "my_vpc_1" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "ExampleAppServerInstanceTerraform"
#   }
# }

# resource "aws_subnet" "my_subnet_1" {
#   vpc_id            = aws_vpc.my_vpc_1.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "ap-southeast-2a"

#   tags = {
#     Name = "ExampleAppServerInstanceTerraform"
#   }
# }

# resource "aws_internet_gateway" "my_internet_gateway" {
#   vpc_id = aws_vpc.my_vpc_1.id

#   tags = {
#     Name = "ExampleAppServerInstanceTerraform"
#   }
# }

# resource "aws_route_table" "my_route_table" {
#   vpc_id = aws_vpc.my_vpc_1.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.my_internet_gateway.id
#   }
#   route {
#     ipv6_cidr_block = "::/0"
#     gateway_id      = aws_internet_gateway.my_internet_gateway.id
#   }
#   tags = {
#     Name = "ExampleAppServerInstanceTerraform"
#   }
# }

# resource "aws_route_table_association" "subnet-tableroute-a" {
#   subnet_id      = aws_subnet.my_subnet_1.id
#   route_table_id = aws_route_table.my_route_table.id
# }

# resource "aws_security_group" "my_security_group" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = aws_vpc.my_vpc_1.id

#   ingress {
#     description = "TLS from VPC"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     //   ipv6_cidr_blocks = [aws_vpc.my_vpc_1.ipv6_cidr_block]
#   }
#   ingress {
#     description = "http from VPC"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     // ipv6_cidr_blocks = [aws_vpc.my_vpc_1.ipv6_cidr_block]
#   }
#   ingress {
#     description = "SSH from VPC"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     // cidr_blocks      = ["0.0.0.0/0"]
#     // ipv6_cidr_blocks = [aws_vpc.my_vpc_1.ipv6_cidr_block]
#   }


#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "allow_security group"
#   }



# }
# resource "aws_network_interface" "my_network_interface" {
#   subnet_id       = aws_subnet.my_subnet_1.id
#   private_ips     = ["10.0.1.50"]
#   security_groups = [aws_security_group.my_security_group.id]
# }

# resource "aws_eip" "my_eip" {
#   network_interface         = aws_network_interface.my_network_interface.id
#   associate_with_private_ip = "10.0.1.50"
#   depends_on                = [aws_internet_gateway.my_internet_gateway]
# }

# resource "aws_instance" "my_instance" {
#   ami               = "ami-09eebd0b9bd845bf1"
#   instance_type     = "t2.micro"
#   availability_zone = "ap-southeast-2a"
#   network_interface {
#     device_index         = 0
#     network_interface_id = aws_network_interface.my_network_interface.id
#   }
#   user_data = <<-EOF
#     #!bin/bash
#     sudo apt update -y
#     sudo apt install apache2 -y
#     sudo systemctl start apache2
#     sudo bash -c 'echo webserver > /var/www/html/index.html'
#     EOF
#   tags = {
#     Name = "webserver"
#   }
# }
