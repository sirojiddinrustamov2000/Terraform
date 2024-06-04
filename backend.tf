terraform {
  backend "s3" {
    bucket         = "sirojtntkbucket" # bucket name
    region         = "us-east-1"       # region place to choose
    key            = "dev-env-tfstate" # name of the state file
    dynamodb_table = "lesson2-locking"

  }
}
