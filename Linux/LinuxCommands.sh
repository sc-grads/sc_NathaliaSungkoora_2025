#!/bin/bash

# ------------------------------------------------------------------------------
# Basic Linux Commands Cheat Sheet For Reference
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# Key Linux Directory Structure
# ------------------------------------------------------------------------------

# Root Directory ( / )
/bin # Contains essential binary files (executables) like system programs.
/etc #Configuration files for system and applications.
/home #User home directories (e.g., /home/jason).
/opt #Directory for optional/third-party software (e.g., /opt/google).
/tmp #Temporary space, cleared at boot time.
/usr #Contains user-related programs (e.g., /usr/bin for binaries).
/var #Stores variable data, such as log files.

# Additional Directories:
  
/boot #Contains files needed to start the OS (e.g., the Linux kernel).
/media #Mount point for external devices like USB drives or CD-ROMs.
/root #Home directory for the root user.
/srv #Data served by the system, such as web files.

# Application Directory Structures:
  
/usr/local #Non-system applications.
/opt # Non-bundled software (e.g., /opt/avg for AVG antivirus).

# General Application Install Locations:
/opt/ or /usr/local/ #for company-specific software.



# ------------------------------------------------------------------------------
# Basic Linux Commands Continued
# ------------------------------------------------------------------------------


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

# ------------------------------------------------------------------------------
# Cron Jobs Management
# ------------------------------------------------------------------------------

# List current cron jobs
crontab -l                # Lists the current cron jobs for the user, showing scheduled tasks

# Edit the crontab
crontab -e                 # Opens the user's crontab file in the default text editor to add or edit cron jobs

# Remove the crontab
crontab -r                 # Removes the current user's crontab (deletes all scheduled cron jobs)

# Display the system crontab for a specific user
sudo crontab -l -u <user>  # Lists the cron jobs for a specific user (requires sudo privileges)

# Edit a specific user's crontab
sudo crontab -e -u <user>  # Edits the crontab for a specific user (requires sudo privileges)

# ------------------------------------------------------------------------------
# Oracle Database and User Management (Simplified)
# ------------------------------------------------------------------------------

# Check the status of Oracle service (if configured with systemd)
sudo systemctl status oracle    # Check if the Oracle service is running and its status

# Search for Oracle-related directories
sudo find / -type d -name "oracle*"    # Search for directories that contain "oracle" in their name

# List all running processes and filter by Oracle (if Oracle is running)
ps -ef | grep oracle    # Search for any processes related to Oracle in the running process list

# Search for Oracle-related files
sudo find /home/oracle_linuxsvr -type f -name "*oracle*"    # Search for files related to Oracle in a specific directory

# Check for Oracle logs
sudo find / -type f -name "*oracle*.log"    # Search for Oracle log files (those ending in .log) in the system

# Start Oracle using init.d script (if available)
sudo /etc/init.d/oracle start    # Start the Oracle database service using the init.d script (if available)

# Switch to Oracle user
su - oracle_linuxsvr    # Switch to the 'oracle_linuxsvr' user account (Oracle user)

# ------------------------------------------------------------------------------
# User Switching and Privilege Management
# ------------------------------------------------------------------------------

# Switch to another user
su oracle_linuxsvr    # Switch to the 'oracle_linuxsvr' user

# Switch to another user with login shell
su - oracle_linuxsvr    # Switch to the 'oracle_linuxsvr' user and load their environment variables and shell

# Try to switch back to another user (e.g., nathaliasungkoora)
su - nathaliasungkoora    # Switch to the 'nathaliasungkoora' user (if available)

# Display the environment variable TEST
echo $TEST    # Display the value of the TEST environment variable (useful for debugging)

# Execute command with root privileges
sudo <command>    # Run a command with superuser privileges (e.g., sudo apt update, sudo ls)

# Run a command as another user with sudo
sudo -u <username> <command>    # Run a command as another user (e.g., sudo -u oracle ls)

# Open an interactive shell as root
sudo -i    # Open an interactive root shell with full privileges, allowing you to execute commands as root

# List sudo privileges for the current user
sudo -l    # Show the list of commands the current user can execute with sudo privileges


# ------------------------------------------------------------------------------
#  Shell History, Command Repetition, and Auto-Completion
# ------------------------------------------------------------------------------

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



# ------------------------------------------------------------------------------
#  AlmaLinux (RPM-based) Commands
# ------------------------------------------------------------------------------

# Package Management Commands
# ----------------------------------------

# Install a package
sudo dnf install -y <package-name>    # Installs a package with automatic confirmation

# List all installed packages
rpm -qa                                # Lists all installed packages on the system

# Query a specific package
rpm -q <package-name>                  # Displays information about a specific installed package

# Remove a package
sudo dnf remove -y <package-name>      # Removes a package without asking for confirmation

# Upgrade all packages
sudo dnf upgrade -y                    # Upgrades all installed packages to the latest version available

# Clean up cached packages and metadata
sudo dnf clean all                     # Cleans the DNF cache, freeing up space by removing unused metadata and packages

# List available updates
sudo dnf check-update                  # Checks for available package updates

# Search for a package
sudo dnf search <package-name>         # Searches for a package in the repositories

# Display information about a package
sudo dnf info <package-name>           # Shows detailed information about a specific package

# Show the history of transactions
sudo dnf history                       # Shows a history of package transactions (installs, removals, upgrades, etc.)


# ------------------------------------------------------------------------------
#  Debian (Debian-based) Commands
# ------------------------------------------------------------------------------

# Package Management Commands
# ---------------------------------------

# Update package list
sudo apt update                  # Updates the package index to ensure you're installing the latest versions

# Install a package
sudo apt install -y <package-name>  # Installs a package without asking for confirmation

# List all installed packages
dpkg -l                          # Lists all installed packages on the system

# Query a specific package
dpkg -s <package-name>            # Shows detailed information about a specific installed package

# Install a .deb package (make sure the file exists and is valid)
dpkg -i example_1.0_all.deb       # Installs a .deb package file. Ensure the file is valid and not corrupted

# Upgrade all packages
sudo apt upgrade -y               # Upgrades all installed packages to the latest available version

# Package Removal Commands
# ----------------------------------------

# Remove a package (keeps configuration files)
sudo apt remove -y <package-name>  # Removes a package but leaves its configuration files intact

# Remove a package (including configuration files)
sudo apt purge -y <package-name>   # Removes a package and its associated configuration files

# Clean up unnecessary dependencies
sudo apt autoremove -y             # Removes packages that were installed as dependencies but are no longer needed


#------------------------------------------------------------------------------------------------------------------------------------------------------------