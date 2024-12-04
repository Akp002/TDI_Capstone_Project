#!/bin/bash

# Define the data-hub folder (absolute path to the data-hub directory)
data_hub="./data-hub"

# Check if the data-hub folder exists
if [ ! -d "$data_hub" ]; then
    echo "The folder '$data_hub' not found!!"
    exit 1
fi

# Initialize the header_written flag as false
header_written=false

# Define the db folder (absolute path to the db directory)
output_folder="./db"

# Create the db folder if it doesn't exist
mkdir -p "$output_folder"

# Loop through all CSV files in the data-hub folder and append them into a single file
for file in "$data_hub"/*.csv; do
    # Check if the file exists
    if [ -f "$file" ]; then
        echo "Processing file: $file"

        # Write the header from the first file only
        if [ "$header_written" = false ]; then
            head -n 1 "$file" > "$output_folder/data.csv"
            header_written=true
        fi

        # Append the data (skip the header) to the output file
        tail -n +2 "$file" >> "$output_folder/data.csv"
    else
        echo "No CSV files found in '$data_hub'"
    fi
done

echo "Data integration complete! Output saved in '$output_folder/data.csv'."
