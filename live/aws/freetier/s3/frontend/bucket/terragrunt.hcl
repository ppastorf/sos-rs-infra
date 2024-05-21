# https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/

terraform {
  source = "tfr:///terraform-aws-modules/s3-bucket/aws?version=4.1.2"
}

include "env" {
  path = find_in_parent_folders()
  expose = true
}

locals {
  name = "${include.env.locals.env_prefix}-frontend-bucket"
}

inputs = {
  bucket = local.name

  force_destroy       = true

  # managed cloudfront CDN
  acceleration_status = "Suspended"

  request_payer       = "BucketOwner"

  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object_lock_configuration
  # object_lock_enabled = true
  # object_lock_configuration = {
  #   rule = {
  #     default_retention = {
  #       mode = "GOVERNANCE"
  #       days = 1
  #     }
  #   }
  # }

  # Bucket policies
  # attach_policy = true
  # policy        = <<EOF
  # EOF
  #
  # attach_deny_insecure_transport_policy    = true
  # attach_require_latest_tls_policy         = true
  # attach_deny_incorrect_encryption_headers = true
  # attach_deny_incorrect_kms_key_sse        = true
  # allowed_kms_key_arn                      = aws_kms_key.objects.arn
  # attach_deny_unencrypted_object_uploads   = true

  # S3 Bucket Ownership Controls
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls
  control_object_ownership = true
  object_ownership         = "BucketOwnerPreferred"

  expected_bucket_owner = include.env.locals.account_id

  acl = "private" # "acl" conflicts with "grant" and "owner"

  # logging = {
  #   target_bucket = ""
  #   target_prefix = "log/"
  #   target_object_key_format = {
  #     partitioned_prefix = {
  #       partition_date_source = "DeliveryTime" # "EventTime"
  #     }
  #     # simple_prefix = {}
  #   }
  # }

  versioning = {
    status     = true
    mfa_delete = false
  }

  # website = {
  #   index_document = "index.html"
  #   error_document = "error.html"
  #   routing_rules = [{
  #     condition = {
  #       key_prefix_equals = "docs/"
  #     },
  #     redirect = {
  #       replace_key_prefix_with = "documents/"
  #     }
  #     }, {
  #     condition = {
  #       http_error_code_returned_equals = 404
  #       key_prefix_equals               = "archive/"
  #     },
  #     redirect = {
  #       host_name          = "archive.myhost.com"
  #       http_redirect_code = 301
  #       protocol           = "https"
  #       replace_key_with   = "not_found.html"
  #     }
  #   }]
  # }

  # server_side_encryption_configuration = {
  #   rule = {
  #     apply_server_side_encryption_by_default = {
  #       kms_master_key_id = aws_kms_key.objects.arn
  #       sse_algorithm     = "aws:kms"
  #     }
  #   }
  # }
  #
  # cors_rule = [
  #   {
  #     allowed_methods = ["PUT", "POST"]
  #     allowed_origins = ["https://modules.tf", "https://terraform-aws-modules.modules.tf"]
  #     allowed_headers = ["*"]
  #     expose_headers  = []
  #     max_age_seconds = 3000
  #     }, {
  #     allowed_methods = ["PUT"]
  #     allowed_origins = ["https://example.com"]
  #     allowed_headers = ["*"]
  #     expose_headers  = ["ETag"]
  #     max_age_seconds = 3000
  #   }
  # ]
  #
  # lifecycle_rule = [
  #   {
  #     id      = "log"
  #     enabled = true
  #
  #     filter = {
  #       tags = {
  #         some    = "value"
  #         another = "value2"
  #       }
  #     }
  #
  #     transition = [
  #       {
  #         days          = 30
  #         storage_class = "ONEZONE_IA"
  #         }, {
  #         days          = 60
  #         storage_class = "GLACIER"
  #       }
  #     ]
  #
  #     #        expiration = {
  #     #          days = 90
  #     #          expired_object_delete_marker = true
  #     #        }
  #
  #     #        noncurrent_version_expiration = {
  #     #          newer_noncurrent_versions = 5
  #     #          days = 30
  #     #        }
  #   },
  #   {
  #     id                                     = "log1"
  #     enabled                                = true
  #     abort_incomplete_multipart_upload_days = 7
  #
  #     noncurrent_version_transition = [
  #       {
  #         days          = 30
  #         storage_class = "STANDARD_IA"
  #       },
  #       {
  #         days          = 60
  #         storage_class = "ONEZONE_IA"
  #       },
  #       {
  #         days          = 90
  #         storage_class = "GLACIER"
  #       },
  #     ]
  #
  #     noncurrent_version_expiration = {
  #       days = 300
  #     }
  #   },
  #   {
  #     id      = "log2"
  #     enabled = true
  #
  #     filter = {
  #       prefix                   = "log1/"
  #       object_size_greater_than = 200000
  #       object_size_less_than    = 500000
  #       tags = {
  #         some    = "value"
  #         another = "value2"
  #       }
  #     }
  #
  #     noncurrent_version_transition = [
  #       {
  #         days          = 30
  #         storage_class = "STANDARD_IA"
  #       },
  #     ]
  #
  #     noncurrent_version_expiration = {
  #       days = 300
  #     }
  #   },
  # ]

  # intelligent_tiering = {
  #   general = {
  #     status = "Enabled"
  #     filter = {
  #       prefix = "/"
  #       tags = {
  #         Environment = "dev"
  #       }
  #     }
  #     tiering = {
  #       ARCHIVE_ACCESS = {
  #         days = 180
  #       }
  #     }
  #   },
  #   documents = {
  #     status = false
  #     filter = {
  #       prefix = "documents/"
  #     }
  #     tiering = {
  #       ARCHIVE_ACCESS = {
  #         days = 125
  #       }
  #       DEEP_ARCHIVE_ACCESS = {
  #         days = 200
  #       }
  #     }
  #   }
  # }
  # 
  # metric_configuration = [
  #   {
  #     name = "documents"
  #     filter = {
  #       prefix = "documents/"
  #       tags = {
  #         priority = "high"
  #       }
  #     }
  #   },
  #   {
  #     name = "other"
  #     filter = {
  #       tags = {
  #         production = "true"
  #       }
  #     }
  #   },
  #   {
  #     name = "all"
  #   }
  # ]
}

