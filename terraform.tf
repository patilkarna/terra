# resource "aws_instance" "example_instance" {
#   ami           = "ami-053b0d53c279acc90"  # Ubuntu 20.04 LTS (HVM)
#   instance_type = "t2.micro"
# }

# resource "aws_s3_bucket" "my_bucket" {
#   bucket = "terraform-s3-bucket-sagar"
#   acl    = "private"  # You can adjust the ACL as needed
# }
provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

# Create an AWS key pair
resource "aws_key_pair" "my_keypair" {
  key_name   = "my-key" # Specify your desired key pair name
  public_key = file("~/.ssh/id_rsa.pub") # Replace with the path to your public key file
}

# Create a security group with inbound rules
resource "aws_security_group" "example_security_group" {
  name = "my-sg" # Specify the desired security group name

  # Ingress rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere (make more restrictive in production)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere
  }

  # Add more ingress rules as needed
}

# Launch an EC2 instance using the key pair and security group
resource "aws_instance" "example_instance" {
  ami           = "ami-053b0d53c279acc90" # Replace with your desired AMI
  instance_type = "t2.micro"             # Replace with your desired instance type
  key_name      = aws_key_pair.example_keypair.key_name # Reference the key pair
  security_groups = [aws_security_group.example_security_group.name] # Reference the security group

  # (Optional) Additional configuration for your instance
  # ...

  tags = {
    Name = "test"
  }
}
