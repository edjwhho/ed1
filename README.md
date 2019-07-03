# ed1
test terraform tfs
#########################################
S3 Bucket Permissions
Terraform will need the following AWS IAM permissions on the target backend bucket:

s3:ListBucket on arn:aws:s3:::mybucket

s3:GetObject on arn:aws:s3:::mybucket/path/to/my/key

s3:PutObject on arn:aws:s3:::mybucket/path/to/my/key

##########################################

DynamoDB Table Permissions
If you are using state locking, Terraform will need the following AWS IAM permissions on the DynamoDB table (arn:aws:dynamodb:::table/mytable):

dynamodb:GetItem
dynamodb:PutItem
dynamodb:DeleteItem

