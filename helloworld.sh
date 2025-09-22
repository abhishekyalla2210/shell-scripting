#!/bin/bash

START_TIME=$(date %s)

slepp 5
END_TIME=$(date %S)

TOTAL_TIME=(($START_TIME-$END_TIME))

echo "$DATE is the date" 