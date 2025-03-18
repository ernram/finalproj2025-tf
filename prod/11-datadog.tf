# resource "aws_cloudformation_stack" "DatadogIntegration" {
#   name = "DatadogIntegration"
#   capabilities = ["CAPABILITY_IAM", "CAPABILITY_NAMED_IAM", "CAPABILITY_AUTO_EXPAND"]
#   parameters = {
#     APIKey = var.datadog_api_key
#     APPKey = var.datadog_application_key
#     DatadogSite = var.datadog_region
#     InstallLambdaLogForwarder = true
#     IAMRoleName = "DatadogIntegrationRole"
#     CloudSecurityPostureManagement = false
#     DisableMetricCollection = false
#   }
#   template_url = "https://datadog-cloudformation-template.s3.amazonaws.com/aws/main.yaml"

#   lifecycle {
#     ignore_changes = [
#       parameters["APIKey"],
#       parameters["APPKey"]
#     ]
#   }
# }

resource "aws_cloudformation_stack" "datadog-aws-integration" {
  name         = "datadog-aws-integration"
  capabilities = ["CAPABILITY_IAM", "CAPABILITY_NAMED_IAM", "CAPABILITY_AUTO_EXPAND"]
  parameters = {
    ExternalId      = var.external_id
    DdApiKey        = var.datadog_api_key
    DdForwarderName = var.datadog_application_key
  }
  template_url = "https://datadog-cloudformation-template.s3.amazonaws.com/aws/main.yaml"
}