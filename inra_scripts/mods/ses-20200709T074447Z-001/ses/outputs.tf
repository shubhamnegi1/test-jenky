output "secret" {
  value = aws_iam_access_key.vf_ses_key.ses_smtp_password_v4

}
