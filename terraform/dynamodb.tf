module "dynamodb_table1" {
  source = "terraform-aws-modules/dynamodb-table/aws"

  name = "rob-test-posts"
  hash_key = "id"

  attributes = [
   {
     name = "id"
     type = "S"
   }
  ]
}
