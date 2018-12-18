#!/bin/bash

S3_BUCKET_NAME="sample-bucket"
S3_PRJ_NAME="helloworld"
S3_DEPLOY_DIR="s3://${S3_BUCKET_NAME}/${S3_PRJ_NAME}/deploy/"
S3_TEMPLATE_DIR="s3://${S3_BUCKET_NAME}/${S3_PRJ_NAME}/template/"
STACK_NAME="helloworld"
REGION="ap-northeast-1"
TEMPLATE_URL="https://s3-${REGION}.amazonaws.com/${S3_BUCKET_NAME}/${S3_PRJ_NAME}/template/template.yaml"

