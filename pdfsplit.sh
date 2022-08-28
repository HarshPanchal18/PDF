#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Monday 30 May 2022 06:10:55 PM IST
# Author: Harsh Panchal

# Usage:
#------------------------------------------

if [ $# -lt 4 ]
then
    echo "Usage : pdfsplit input.pdf first_page last_page output.pdf"
    exit 1
fi

yes | gs -dBatch -sOutputFile="$4" -dFirstPage=$2 -dLastPage=$3 -sDEVICE=pdfwrite
