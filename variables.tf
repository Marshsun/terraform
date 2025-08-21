# vpc variables

variable "cidr_block_vpc" {
  description = "cidr block for vpc"
}

variable "instance_tenancy" {
  description = "vpc tenancy"
}

variable "name_vpc" {
  description = "vpc name"
}



# public subnet variables

variable "cidr_block_pub_subnet" {
  description = "public subnet cidr block"
}

variable "availability_zone_pub_subnet" {
  description = "public subnet availability zone"
}

variable "name_pub_subnet" {
  description = "public subnet name"
}



# private subnet variables

variable "cidr_block_pvt_subnet" {
  description = "private subnet cidr block"
}

variable "availability_zone_pvt_subnet" {
  description = "private subnet availability zone"
}

variable "name_pvt_subnet" {
  description = "private subnet name"
}


# internet gateway variables

variable "name_ig" {
  description = "internet gateway name"
}



# public route table variables

variable "cidr_block_pub_RT" {
  description = "cidr block for public route table"
}

variable "name_pub_RT" {
  description = "public route table name"
}



# associate route table variables




# elastic ip address variables

variable "domain_elastic_ip" {
  description = "elastic ip domain"
}

variable "name_elastic_ip" {
  description = "elastic ip name"
}



# NAT gateway variables

variable "name_NAT" {
  description = "NAT gateway name"
}



# private route table variables

variable "cidr_block_pvt_RT" {
  description = "cidr block for private route table"
}

variable "name_pvt_RT" {
  description = "private route table name"
}



# associate route table variables




# instacne in public subnet variables

variable "ami_pub" {
  description = "ami for instacne in public subnet"
}

variable "pub_instance_type" {
  description = "instacne type in public subnet"
}

variable "key_name_pub" {
  description = "key name for instacne in public subnet"
}

variable "name_pub_instance" {
  description = "name public instance"
}



# instacne in private subnet variables

variable "ami_pvt" {
  description = "ami for instacne in private subnet"
}

variable "pvt_instance_type" {
  description = "instacne type in private subnet"
}

variable "key_name_pvt" {
  description = "key name for instacne in private subnet"
}

variable "name_pvt_instance" {
  description = "name private instance"
}