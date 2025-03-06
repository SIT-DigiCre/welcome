#!/bin/bash

# Prettier
npx prettier --write './!(public)/**/*.{css,html,md,scss,svg,yml}'

# Remove blank lines at the end of HTML files
find '.' -type f -name '*.html' -not -path './public/*' -print0 | xargs -0 sed -i -z -e 's/\n$//'
