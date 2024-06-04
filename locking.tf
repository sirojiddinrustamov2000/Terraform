resource "aws_dynamodb_table" "terraform_locking" {
  name         = "lesson2-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}