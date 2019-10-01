resource "aws_iam_role" "LetsEncryptLambda" {
  name = "LetsEncryptLambda-${random_pet.name_suffix.id}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "Route53UpdateRecordSets" {
  name = "Route53UpdateRecordSets"
  role = aws_iam_role.LetsEncryptLambda.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "route53:ListHostedZones",
                "route53:ChangeResourceRecordSets",
                "route53:GetChange"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "S3UpdateFiles" {
  name = "S3UpdateFiles"
  role = aws_iam_role.LetsEncryptLambda.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:List*"
            ],
            "Resource": "arn:aws:s3:::${var.s3_bucket}*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "ParameterStoreUpdate" {
  name = "ParameterStoreUpdate"
  role = aws_iam_role.LetsEncryptLambda.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ssm:PutParameter",
                "ssm:GetParameter*"
            ],
            "Resource": [
              "${data.aws_caller_identity.current.arn}:parameter/${var.ssm_key}",
              "${data.aws_caller_identity.current.arn}:parameter/${var.ssm_cert}",
              "${data.aws_caller_identity.current.arn}:parameter/${var.ssm_ca1}",
              "${data.aws_caller_identity.current.arn}:parameter/${var.ssm_ca2}"
            ]
        }
    ]
}
EOF
}
