#!/bin/bash

# overburden_p5.mac, overburden_p5_01
FILE="overburden.mac"

OUT="ecomug.txt"
> "$OUT"

for i in {1..300}
do
    echo "overburden.mac, overburden_$i" >> "$OUT"
done
	 
