variable "aws_region" {
  description = "AWS region where the infrastructure will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "CpfValidatorTest"
}

variable "lambda_execution_role_arn" {
  description = "ARN of existing IAM role for Lambda execution"
  type        = string
  default     = "arn:aws:iam::264040538379:role/LabRole"
}
