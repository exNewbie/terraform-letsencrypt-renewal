resource "aws_lambda_function" "LetsEncrypt_Renewal" {
  function_name = "LetsEncrypt_Renewal-${random_pet.name_suffix.id}"
  role          = "${aws_iam_role.LetsEncryptLambda.arn}"
  handler       = "LetsEncrypt_Renewal.lambda_handler"
  filename      = "${path.module}/scripts/RenewLetsEncrypt.zip"
  runtime       = "python3.6"
  timeout       = "300"

  environment {
    variables = {
      "S3_BUCKET" : var.s3_bucket
      "S3_PREFIX" : var.s3_prefix
      "EMAIL" : var.email
      "DOMAIN" : var.domain
      "SSM_SSL_KEY" : var.ssm_key
      "SSM_SSL_CA_1" : var.ssm_ca1
      "SSM_SSL_CA_2" : var.ssm_ca2
      "SSM_SSL_CERT" : var.ssm_cert
    }
  }
}

resource "aws_lambda_permission" "LetsEncrypt_Renewal_CloudWatchRule" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.LetsEncrypt_Renewal.function_name}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.LetsEncrypt_Renewal.arn}"
}
