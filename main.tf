resource "aws_vpc" "dev_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "dev-vpc"
  }
}

# get vpc id
output "vpc_id" {
  value = aws_vpc.dev_vpc.id
}

# get vpc arn

output "vpc_cidr_block" {

  value = aws_vpc.dev_vpc.cidr_block
}

#create call to lookup azs
data "aws_availability_zones" "aws" {
  state = "available"

}

output "data_call_result" {
  value = data.aws_availability_zones.aws.names

}

# create 2 public subnets

resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = "10.0.0.0/18"
  availability_zone       = data.aws_availability_zones.aws.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public_1a"
  }
}