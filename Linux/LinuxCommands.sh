#!/bin/bash
echo "Hello, World!"


#!/bin/bash

# Basic Linux Commands Cheat Sheet

# Current directory
pwd        # Shows current directory

# List files
ls         # Lists files in current directory

# Change directory
cd /path   # Change to a specific directory
cd ~       # Change to home directory

# Create and remove directories
mkdir new_folder   # Create a new directory
rmdir folder_name  # Remove an empty directory

# Remove a file
rm file.txt    # Remove a file

# Copy and move files
cp file.txt new_file.txt  # Copy a file
mv file.txt new_name.txt  # Move or rename a file

# View file contents
cat file.txt    # Display file content
less file.txt   # View file one page at a time

# Search inside a file
grep "search" file.txt   # Search for a word in a file

# Disk usage
df -h     # Show disk usage

# Memory usage
free -h   # Show memory usage

# System info
uname -a  # Show system information

# Active processes
ps aux    # List active processes

# Current user
whoami    # Show current user

# Edit file (with nano)
nano file.txt  # Edit file using nano editor

# Show help for a command
man ls     # Show manual for the 'ls' command
