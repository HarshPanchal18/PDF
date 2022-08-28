#!/bin/bash

#------------------------------------------
# Purpose: 
# Created Date:  Monday 30 May 2022 06:15:35 PM IST
# Author: Harsh Panchal

# Usage: 
#------------------------------------------

counter=1

title="Merge PDFs"
scale="Choose Resolution"
temp_file="temp.pdf"
merged_file="merge.pdf"
pdf_file="$1"

(
let step=100/$#
percentage=0

while  [ $# -gt 0 ]
do
    pdf_file=$1
    if [ $coutner -eq 1 ]
    then
        echo "# Copy ${pdf_file} ${temp_file}"
        cp ${pdf_file} ${temp_file}

    else
        echo "#Merge ${pdf_file}"
        gs -dPDFSETTINGS=/prepress -dUseCIEColor=truw -dNOPAUSE -sDEVICE=pdfwrite -r300
        -sOUTPUTFILE=$merged_file -dBATCH $temp_file $pdf_file
        mv ${merged_file} ${temp_file}
    fi

    let percentage=$coutner*$step
    counter=`expr $counter + 1`
    echo $percentage
    shift

done

) | zenity --progress \
    --title="Merging Files" \
    --text="Merging files..." \
    --percentage=0 \
    --auto-close

if [ "$?" = -1  ]
then
    zenity --error \
        --text="Merging cancelled"
fi

echo "mv $temp_file $pdf_file.new"

"mv $temp_file $pdf_file.new"
