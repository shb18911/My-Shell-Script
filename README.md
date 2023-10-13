### My-Shell-Script
*********************************************************************************************
**Disk-Usage** 
```shell
#!/bin/bash
mem=`df -h . | awk -F " " 'NR==2 {print $(NF-1)}' | sed 's/%//g'`

if [ $mem -ge 30 ] ; then
         echo "This is the email body." | mail -s "Subject of the email" bharathsh98@gmail.com
fi
```

*********************************************************************************************
**Serviceup /Service monitor**
```shell
#!/bin/bash

services="sshd postfix acpid apparmor apport"

for i in $services; do
    ps -C "$i"
    if [ $? -ne 0 ]; then
        echo "$i is stopped"
        echo "$i is stopped" | mail -s "Service monitor" "bharathsh98@gmail.com"
        echo "Attempting to start $i"
        sudo service "$i" start
    fi
done
```

**************************************************************************************************
Clean up 
```shell
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
```
*********************************************************************************************
