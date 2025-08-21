# Create aws vpc

resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block_vpc
  instance_tenancy = var.instance_tenancy
  tags = {
    Name = var.name_vpc
  }
}

# create aws public subnet

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_pub_subnet
  availability_zone = var.availability_zone_pub_subnet
  tags = {
    Name = var.name_pub_subnet
  }
}

# create aws private subnet

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_pvt_subnet
  availability_zone = var.availability_zone_pvt_subnet

  tags = {
    Name = var.name_pvt_subnet
  }
}

# create internet gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.name_ig
  }
}

# create a public route table

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr_block_pub_RT
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.name_pub_RT
  }
}

# associate route table

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Create elastic ip address

resource "aws_eip" "lb" {
  domain   = var.domain_elastic_ip

  tags = {
    Name= var.name_elastic_ip
  }
}

# Create NAT gateway

resource "aws_nat_gateway" "example" {
  subnet_id     = aws_subnet.public.id
  allocation_id = aws_eip.lb.id

  tags = {
    Name = "sunmarsh-NAT-GW"
  }
}

# create a private route table

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr_block_pvt_RT
    gateway_id = aws_nat_gateway.example.id
  }

  tags = {
    Name = var.name_pvt_RT
  }
}

# associate route table

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

# create instance in public subnet

resource "aws_instance" "public_instance" {
  ami           = var.ami_pub              
  instance_type = var.pub_instance_type
  key_name = var.key_name_pub
  subnet_id = aws_subnet.public.id
  associate_public_ip_address = true
  

  tags = {
    Name = var.name_pub_instance
  }
}


# create instance in private subnet

resource "aws_instance" "private_instance" {
  ami           = var.ami_pvt          
  instance_type = var.pvt_instance_type
  key_name = var.key_name_pvt
  subnet_id = aws_subnet.private.id
  associate_public_ip_address = false
  

  tags = {
    Name = var.name_pvt_instance
  }
}