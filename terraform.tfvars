cidr_block_vpc ="10.0.0.0/16"
instance_tenancy = "default"
name_vpc = "sunmarsh-vpc"

cidr_block_pub_subnet = "10.0.1.0/24"
availability_zone_pub_subnet = "us-west-1b"
name_pub_subnet = "sunmarsh-public-subnet"

cidr_block_pvt_subnet = "10.0.2.0/24"
availability_zone_pvt_subnet = "us-west-1c"
name_pvt_subnet = "sunmarsh-private-subnet"

name_ig = "sunmarsh-IGW"

cidr_block_pub_RT = "0.0.0.0/0"
name_pub_RT = "sunmarsh-pub-RT"

domain_elastic_ip = "vpc"
name_elastic_ip = "sunmarsh-EIP"

name_NAT = "sunmarsh-NAT-GW"

cidr_block_pvt_RT = "0.0.0.0/0"
name_pvt_RT = "sunmarsh-pvt-RT"

ami_pub = "ami-043b59f1d11f8f189"
pub_instance_type = "t3.micro"
key_name_pub = "sunmarsh-terraform-key"
name_pub_instance = "sunmarsh-server-1"

ami_pvt = "ami-014e30c8a36252ae5"
pvt_instance_type = "t3.small"
key_name_pvt = "sunmarsh-terraform-key"
name_pvt_instance = "sunmarsh-server-2"