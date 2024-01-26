resource "aws_iam_user" "newuser" {
  name = "devops"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

data "aws_iam_policy_document" "lb_ro" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "lb_ro" {
  name   = "test"
  user   = aws_iam_user.newuser.name
  policy = data.aws_iam_policy_document.lb_ro.json
}