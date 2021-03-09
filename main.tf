# Bucket policy for origin access identity
# ========================================================================
locals {
  s3_bucket_frontend_arn = "arn:aws:s3:::${var.s3_bucket_frontend_id}"
}

resource "aws_s3_bucket_policy" "cloudfront_s3_frontend_deploy_policy" {
  bucket = var.s3_bucket_frontend_id
  policy = data.aws_iam_policy_document.s3_policy.json
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions = [
      "s3:GetObject",
    ]
    resources = [
      "${local.s3_bucket_frontend_arn}/*",
    ]

    principals {
      type = "AWS"
      identifiers = [
        var.origin_access_identity_iam_arn,
      ]
    }
  }

  statement {
    actions = [
      "s3:ListBucket",
    ]
    resources = [
      local.s3_bucket_frontend_arn,
    ]

    principals {
      type = "AWS"
      identifiers = [
        var.origin_access_identity_iam_arn,
      ]
    }
  }
}
