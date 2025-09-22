#!/bin/bash

START_TIME=$(date %s)

slepp 5
END_TIME=$(date %S)

TOTAL_TIME=(($END_TIME-$START_TIME))

echo " now the total is:$TOTAL_TIME
