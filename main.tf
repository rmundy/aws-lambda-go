provider "aws" {
  profile = "${var.profile}"
  region  = "${var.region}"
}

resource "aws_dynamodb_table" "family-table" {
  name         = "family-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "Name"
  range_key    = "Age"

  attribute {
    name = "Name"
    type = "S"
  }

  attribute {
    name = "Age"
    type = "N"
  }

  server_side_encryption {
    enabled = true
  }

  tags = {
    Name        = "family-table"
    Environment = "${var.environment}"
    Project     = "${var.project}"
  }
}

