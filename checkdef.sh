#!/bin/bash

# Directory containing .adoc files
DIRECTORY="."

# Output file for missing definitions
OUTPUT_FILE="missing_definitions.txt"

# Clear the output file
> "$OUTPUT_FILE"

# Loop through all .adoc files
for file in "$DIRECTORY"/*.adoc; do
    # Extract references of the form <<X,whatever>>
    grep -oP "<<\K[^,]+" "$file" | while read -r acronym; do
        # Check if the corresponding definition exists
        if ! grep -q "\[\[$acronym\]\]" "$DIRECTORY/acronymes.adoc" && \
           ! grep -q "\[\[$acronym\]\]" "$DIRECTORY/"*.adoc; then
            echo "Missing definition for: $acronym in $file" >> "$OUTPUT_FILE"
        fi
    done
done

echo "Check completed. See $OUTPUT_FILE for missing definitions."