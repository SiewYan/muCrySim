#!/bin/bash

find . \( -name "*#" \
     -o -name "*.wrl" \
     -o -name "*~" \
     \) -print0 | xargs -0 rm -f
