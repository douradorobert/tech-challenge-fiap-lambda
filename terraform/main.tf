# Archive the Lambda code with cpf_validator at the root of the ZIP
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/../src"
  output_path = "${path.module}/../lambda.zip"

  excludes = [
    "__pycache__",
    "*.pyc",
  ]
}

# Lambda function
resource "aws_lambda_function" "cpf_validator" {
  function_name    = var.lambda_function_name
  description      = "CPF Validator Lambda"
  runtime          = "python3.12"
  handler          = "cpf_validator.handler.handler"
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  role = var.lambda_execution_role_arn
}
