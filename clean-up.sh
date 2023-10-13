#!/bin/bash

# Directory where your files are located
directory="/path/to/your/directory"

# Count the total number of files in the directory
total=$(ls "$directory" | wc -l)

# Calculate how many old files need to be deleted
old_files=$(expr "$total" - 20)

# Check if there are old files to delete
if [ "$old_files" -gt 0 ]; then
    # List the files in the directory by modification time,
    # oldest first, and pipe them to xargs to delete them
    ls -rt "$directory" | head -n "$old_files" | xargs rm -rf
    echo "Deleted $old_files old files."
else
    echo "No old files to delete. Retaining the most recent 20 files."
fi 
