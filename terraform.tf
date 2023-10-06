resource "aws_instance" "example_instance" {
  ami           = "ami-08766f81ab52792ce"  # Ubuntu 20.04 LTS (HVM)
  instance_type = "t2.micro"
}

