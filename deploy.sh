#!/bin/bash

. ./param.sh

echo "TEMPLATE_URL: ${TEMPLATE_URL}"

aws cloudformation validate-template --template-url $TEMPLATE_URL 2>&1 1>/dev/null | grep ValidationError
if [ $? = 0 ]; then
    echo "cloudformation template validate error"
    exit 1
fi

aws cloudformation describe-stacks --stack-name $STACK_NAME 2>&1 1>/dev/null | grep error
if [ $? = 0 ]; then
    echo "stack doesn't exist. creating new stack."
    aws cloudformation create-stack --stack-name $STACK_NAME --template-url $TEMPLATE_URL --tags Key=COST,Value=cf-helloworld --region $REGION
    echo "waiting stack create complete..."
    aws cloudformation wait stack-create-complete --stack-name $STACK_NAME
else
    echo "stack exists. updating the stack."
    aws cloudformation update-stack --stack-name $STACK_NAME --template-url $TEMPLATE_URL --tags Key=COST,Value=cf-helloworld --region $REGION
    echo "waiting stack update complete..."
    aws cloudformation wait stack-update-complete --stack-name $STACK_NAME
fi

aws cloudformation describe-stacks --stack-name $STACK_NAME
