# Shell Scripting Notes

## Day 1

### Shell Script Basics

Shell scripts are files containing a series of commands that are executed in sequence. They are commonly used for automating tasks in Unix-like operating systems. Here are some basic concepts:

#### Shebang and Script Execution

```bash
#!/bin/bash

# This shebang line specifies the interpreter to be used (bash in this case).

# Execution
# 1) sh scriptname.sh
# 2) ./scriptname.sh (where . represents the present path)
```

#### Default Shell and Bash Features

- If the shebang line is omitted, the default shell will be used.
- Bash shell invokes features from Korn shell (ksh) and C shell (csh).

```bash
#!/bin/bash
# Script content goes here
```

#### Displaying Files, Directories, and Current Directory

```bash
#!/bin/bash
echo "List the files and dirs"
ls
echo "Present working dir"
pwd
```

#### Displaying Text

```bash
#!/bin/bash
echo "Hi, this is Yaswanth"
echo "I am from Bangalore"
```

#### Passing Arguments to Scripts

```bash
#!/bin/bash
echo "Hi, this is $1"
echo "I am from $2"
```

#### Escape Sequences in `echo`

Escape sequences are used to control the formatting of the output in the `echo` command.

```bash
# Without interpreting escape sequences
echo "  stmnt 1 \n  stmnt 2"

# With interpreting escape sequences
echo -e "  stmnt 1 \n  stmnt 2"
```

### Conditional Statements (Day 2)

#### If Statement

```bash
#!/bin/bash
if [ condition ]
then
  statement
fi
```

#### If-Else Statement

```bash
#!/bin/bash
if [ condition ]
then
  statement1
else
  statement2
fi
```

#### If-Elif-Else Statement

```bash
#!/bin/bash
if [ condition1 ]
then
  statement1
elif [ condition2 ]
then
  statement2
else
  statement3
fi
```

#### Comparator Operations

Comparator operations are used in conditional statements to compare values.

```bash
# Example: Check if a given number is 5 or not
vi 2.sh
#!/bin/bash
if [ $1 -eq 5 ]
then
  echo "$1 is five"
else
  echo "$1 is not five"
fi
```

```bash
# Example: Find the biggest of two numbers
#!/bin/bash
if [ $1 -eq $2 ]
then
  echo "$1 equals to $2"
elif [ $1 -gt $2 ]
then
  echo "$1 is greater than $2"
else
  echo "$2 is greater than $1"
fi
```

### Assignment

1. Explore and use special variables like `$#`, `$*`, and `$?`.
2. Create a script that prints messages based on the number of arguments passed.

## Day 3

### While Loop

```bash
#!/bin/bash
n=5
while [ $n -ge 1 ]
do
  echo $n
  n=`expr $n - 1`
done
```

### Factorial Calculation

```bash
#!/bin/bash
n=$1
f=1
while [ $n -gt 0 ]
do
  f=`expr $n \* $f`
  n=`expr $n - 1`
done
echo "Factorial of $1 is $f"
```

### Read File Line by Line

```bash
while read line
do
  echo $line
done < file
```

### Line Number and Word Count

```bash
#!/bin/bash
lineno=1
while read line
do
  words=`echo $line | wc -w`
  echo "$lineno : $words"
  lineno=`expr $lineno + 1`
done < 1.txt
```

## Day 4

### Crontab

Crontab is a time-based job scheduler in Unix-like operating systems.

```bash
# Schedule a script tomorrow @ 7:30 PM
30 19 20 09 03 script_path

# Schedule a script to run every Monday @ 2 PM
00 14 * * 01 script_path

# Schedule a script @10:30 PM on Monday and Thursday
30 22 * * 01,04 script_path
```

### Cleanup Script

```bash
#!/bin/bash
total=`ls PATH | wc -l`
old_files=`expr $total - 20`
if [ $old_files -gt 0 ]; then
  ls -rt | head -$old_files | xargs rm -rf
fi
```

**Crontab Entry:**
```bash
00 11 * * 01 /PATH_of_script
```

### Monitoring Services Script

```bash
#!/bin/bash
services="service1 service2 service3"
for i in $services; do
  ps -c $i
  if [ $? -ne 0 ]; then
    echo "$i stopped" | mail -s "Service Monitor" your@gmail.com
    echo "Service stopped"
    sudo service $i start
  fi
done
```

**Note:** Ensure to stop the service gracefully using `sudo service service_name stop` before running the cleanup script.

These scripts demonstrate basic concepts of shell scripting, conditional statements, loops, file processing, and scheduling tasks using crontab. Explore and modify them to suit your specific needs.
