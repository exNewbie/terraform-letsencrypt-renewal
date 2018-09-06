# terraform-letsencrypt-renewal
Renew LetsEncrypt certs and sync files to S3.

Terraform creates
* ECS/Fargate components
* Lambda function that update the desired value of service of the cluster
* CloudWatch rule that triggers the Lambda function every 11 weeks (77 days) (LetsEncrypt cert expires every 90 days)
* SNS that sends emails about results of renewal(s)
* IAM role and its policies
