module "dynamodb_table1" {
  source = "terraform-aws-modules/dynamodb-table/aws"

  name = "rob-test-posts-${var.site}-${var.environment}"
  hash_key = "id"

  attributes = [
   {
     name = "id"
     type = "S"
   }
  ]
}
