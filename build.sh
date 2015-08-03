#!/bin/bash

# usage build.sh <path_to_cap_file>
caps=$(sed -n 's/^#define \(CAP_.*\) .*/\1/p' "$1" | head -n -2 | tr "" "\n")
echo "$caps" > "src/caps.rs"
