output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = aws_lambda_function.cpf_validator.function_name
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.cpf_validator.arn
}

output "lambda_role_arn" {
  description = "ARN of the Lambda execution role"
  value       = var.lambda_execution_role_arn
}
