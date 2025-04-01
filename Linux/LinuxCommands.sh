#!/bin/bash

# Basic Linux Commands Cheat Sheet For Reference

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

# Show current processes
ps         # Displays a snapshot of the current processes running in your terminal session

# Show specific process by PID
ps -p 514   # Displays information about the process with PID 514, which is a bash session

# Show full format process details
ps -f       # Displays a full-format listing of processes, showing additional information like the parent process ID (PPID) and user ID (UID)

# Show all running processes
ps -e       # Displays a list of all the running processes on the system, with each process's PID and associated information

# Show full list of all processes
ps -ef      # Displays a full-format list of all running processes on the system, including detailed information like the parent process ID (PPID), start time, and command

# Paged output of all processes
ps -ef | less   # Paginates the output of ps -ef using less, allowing you to scroll through the process list


# Full process listing
ps -ef    # Displays a full list of all running processes on the system

# Processes for a user
ps -u <username>   # Shows processes running for a specific user

# Send a job to the background
bg %<job_number>   # Moves a job to the background based on job number

# Bring a job to the foreground
fg %<job_number>   # Brings a background job to the foreground based on job number

# Terminate a process by PID
kill <pid>    # Terminates a process using its PID (Process ID)

# List active jobs
jobs    # Lists the currently active jobs in the shell


# List current cron jobs
crontab -l                # Lists the current cron jobs for the user

# Edit the crontab
crontab -e                 # Opens the crontab file in the default editor for editing

# Remove the crontab
crontab -r                 # Removes the current user's crontab

# Display the system crontab
sudo crontab -l -u <user>  # Lists the cron jobs for a specific user (requires sudo)

# Edit a specific user's crontab
sudo crontab -e -u <user>  # Edits the crontab for a specific user (requires sudo)


# Check the status of Oracle service (if configured with systemd)
sudo systemctl status oracle    # Check if the Oracle service is running

# Search for Oracle-related directories
sudo find / -type d -name "oracle*"    # Search for directories related to Oracle

# List all running processes and filter by Oracle (if Oracle is running)
ps -ef | grep oracle    # Search for Oracle-related processes

# Search for Oracle-related files
sudo find /home/oracle_linuxsvr -type f -name "*oracle*"    # Search for Oracle files

# Check for Oracle logs
sudo find / -type f -name "*oracle*.log"    # Search for Oracle log files

# Start Oracle using init.d script (if available)
sudo /etc/init.d/oracle start    # Start Oracle database using init.d script (if available)

# Attempt to switch to another user (Oracle user)
su - oracle_linuxsvr    # Switch to Oracle user (oracle_linuxsvr)

# List crontab jobs for the current user
crontab -l    # List crontab jobs for the current user

# Try to switch back to another user using su
su -nathaliasungkoora    # Switch to the nathaliasungkoora user (incorrect usage, for reference)

# Display the environment variable TEST
echo $TEST    # Display the value of TEST (useful for troubleshooting)


# Switch to another user
su oracle_linuxsvr    # Switch to the 'oracle_linuxsvr' user

# Switch to another user with login shell
su - oracle_linuxsvr    # Switch to the 'oracle_linuxsvr' user and load their environment

# Execute command with root privileges
sudo <command>    # Run a command with superuser privileges (e.g., sudo apt update)

# Run a command as another user with sudo
sudo -u <username> <command>    # Run a command as another user (e.g., sudo -u oracle ls)

# Open an interactive shell as root
sudo -i    # Open an interactive shell with root privileges

# List sudo privileges for the current user
sudo -l    # Display available sudo privileges for the current user


###  Shell History, Command Repetition, and Auto-Completion

# View shell history
history    # Display a list of previously executed commands

# Repeat the command at position n
!n    # Replace 'n' with the command number to repeat a specific command (e.g., !3 to repeat command 3)

# Repeat the previous command
!!    # Repeat the last executed command

# Repeat the last command starting with a specific letter
!letter    # Replace 'letter' with the first letter of the command (e.g., !c for the last command starting with "c")

# Extract the nth argument from the previous command
!:n    # Replace 'n' with the argument position (e.g., !:2 for the second argument)

# Extract the first argument from the previous command
!^    # First argument of the previous command (same as !:1)

# Extract the last argument from the previous command
!$    # Last argument of the previous command

# Reverse search for a command in history
Ctrl + r    # Press Ctrl + r and start typing to search through previously run commands

# Complete commands with Tab
Tab    # Press Tab after typing part of a command to auto-complete the rest

# Show available completions for a command or filename with double Tab
Tab + Tab    # Press Tab twice to show a list of possible completions

# Complete filenames or directory names with Tab
Tab    # Press Tab to complete file and directory names (e.g., typing "ls fi" and pressing Tab will complete "files.txt")

# Complete environment variable names with Tab
Tab    # Press Tab after typing part of an environment variable (e.g., typing "HIST" and pressing Tab will complete the variable name)

# Complete usernames with Tab
Tab    # Press Tab after typing ~ to auto-complete usernames (e.g., "~u" to complete the user "ubuntu")
