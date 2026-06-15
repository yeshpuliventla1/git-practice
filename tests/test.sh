#!/bin/bash
echo "Validating HTML files..."

test -f index.html || exit 1
test -f dependencies.html || exit 1

echo "Build Validation Successful"
