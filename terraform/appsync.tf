module "appsync" {
  source = "terraform-aws-modules/appsync/aws"

  name = "rob-test-${var.site}-${var.environment}"

  schema = file("schema.graphql")

  api_keys = {
    future  = "2021-10-20T13:00:00Z"
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
      request_template  = file("vtl-templates/request.Mutation.putPost.vtl")
      response_template = file("vtl-templates/response.Mutation.putPost.vtl")
    }

    "query.post" = {
      data_source   = "dynamodb_table1"
      request_template  = file("vtl-templates/request.Query.post.vtl")
      response_template = file("vtl-templates/response.Query.post.vtl")
    }
  }

}
