resource "aws_cloudwatch_event_rule" "LetsEncrypt_Renewal" {
  name                = "LetsEncrypt_Renewal-${random_pet.name_suffix.id}"
  schedule_expression = "rate(${var.renewal_period} days)"
  is_enabled          = var.is_enable_schedule
}

resource "aws_cloudwatch_event_target" "LetsEncrypt_Renewal-Target" {
  rule = "${aws_cloudwatch_event_rule.LetsEncrypt_Renewal.name}"
  arn  = "${aws_lambda_function.LetsEncrypt_Renewal.arn}"
}
