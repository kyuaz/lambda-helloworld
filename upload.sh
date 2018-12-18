#!/bin/bash

. ./param.sh

echo "S3_DEPLOY_DIR: ${S3_DEPLOY_DIR}"
echo "S3_TEMPLATE_DIR: ${S3_TEMPLATE_DIR}"
aws s3 cp lambda.zip $S3_DEPLOY_DIR
aws s3 cp template.yaml $S3_TEMPLATE_DIR
aws s3 ls $S3_TEMPLATE_DIR

