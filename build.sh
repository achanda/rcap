#!/bin/bash

# usage build.sh <path_to_cap_file>
out_file="src/caps.rs"
caps=$(sed -n 's/^#define \(CAP_.*\) .*/\1/p' "$1" | head -n -2 | tr -d ' ' | sed -e 's/$/,/g' )
echo "#![crate_name = \"rcap\"]" > $out_file
echo "#![crate_type = \"dylib\"]" >> $out_file
echo "pub enum Caps {" >> $out_file
echo "$caps" >> $out_file
echo "}" >> $out_file
