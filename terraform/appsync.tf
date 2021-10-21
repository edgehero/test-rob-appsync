module "appsync" {
  source = "terraform-aws-modules/appsync/aws"

  name = "rob-test-${var.site}-${var.environment}"

  schema = file("${path.module}/schema.graphql")

  api_keys = {
    default = null
  }

  authentication_type = "API_KEY"

  datasources = {
    dynamodb_table1 = {
      type = "AMAZON_DYNAMODB"
      table_name = "rob-test-posts-${var.site}-${var.environment}"
      region     = "eu-west-1"
    }
  }

  resolvers = {
    "Mutation.putPost" = {
      data_source   = "dynamodb_table1"
      request_template  = file("${path.module}/vtl-templates/request.Mutation.putPost.vtl")
      response_template = file("${path.module}/vtl-templates/response.Mutation.putPost.vtl")
    }

    "Query.post" = {
      data_source   = "dynamodb_table1"
      request_template  = file("${path.module}/vtl-templates/request.Query.post.vtl")
      response_template = file("${path.module}/vtl-templates/response.Query.post.vtl")
    }
  }

}
