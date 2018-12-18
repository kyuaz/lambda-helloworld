#!/bin/bash

npm test
if [ $? = 0 ]; then
    echo "npm test ok."
else
    echo "npm test failed"
    exit 1
fi
