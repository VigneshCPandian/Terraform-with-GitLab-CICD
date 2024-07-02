#1 vpc, 1 subnet and 1 security

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true  

    tags = {
        Name = "myvpc"
    }
}

resource "aws_subnet" "ps_sn" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  map_customer_owned_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    Name = "pb_sn1"
  }
}

resource "aws_securiy" "sg" {
    vpc_id = aws_vpc.myvpc.id
    name = "my_sg"
    description = "Public Security"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_block = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_block = ["0.0.0.0/0"]
    }
}