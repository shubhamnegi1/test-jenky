

resource "aws_iam_user" "vf_ses" {
  name = var.vf_ses_name
  path = "/system/"
}

resource "aws_iam_access_key" "vf_ses_key" {
  user    = aws_iam_user.vf_ses.name
}
resource "aws_ses_email_identity" "example" {
  email = "mahesh.nahta@nagarro.com"
}

resource "aws_iam_user_policy" "ses_ro" {
  name = "AmazonSesSendingAccess"
  user = aws_iam_user.vf_ses.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ses:SendRawEmail",
            "Resource": "*"
        }
    ]
}
EOF
}
