# resource "aws_instance" "example_instance" {
#   ami           = "ami-053b0d53c279acc90"  # Ubuntu 20.04 LTS (HVM)
#   instance_type = "t2.micro"
# }

resource "aws_s3_bucket" "my_bucket" {
  bucket = "terraform-s3-bucket-sagar"
  acl    = "private"  # You can adjust the ACL as needed
}