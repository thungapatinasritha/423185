#!/bin/bash

# 1. Create a backup using the tar command (tarball format)
create_tar_backup() {
    echo "Creating a tarball backup of the directory 'data' as 'data_backup.tar.gz'..."
    tar -czvf data_backup.tar.gz data/
    echo "Backup created successfully: data_backup.tar.gz"
    echo ""
}

# 2. Extract files from a tar archive
extract_tar_backup() {
    echo "Extracting files from 'data_backup.tar.gz'..."
    tar -xzvf data_backup.tar.gz
    echo "Backup extracted successfully"
    echo ""
}

# 3. Create a backup using the cpio command (copy files into an archive)
create_cpio_backup() {
    echo "Creating a cpio backup of the directory 'data' as 'data_backup.cpio'..."
    find data/ -print | cpio -o > data_backup.cpio
    echo "Backup created successfully: data_backup.cpio"
    echo ""
}

# 4. Extract files from a cpio archive
extract_cpio_backup() {
    echo "Extracting files from 'data_backup.cpio'..."
    cpio -id < data_backup.cpio
    echo "Backup extracted successfully"
    echo ""
}

# 5. Create a tar backup with compression and exclusion of specific files
create_tar_with_exclusion() {
    echo "Creating a tarball backup of 'data' excluding 'data/temp/*' as 'data_backup_excluded.tar.gz'..."
    tar --exclude='data/temp/*' -czvf data_backup_excluded.tar.gz data/
    echo "Backup created successfully: data_backup_excluded.tar.gz"
    echo ""
}

# 6. Create a tar backup, store it at a remote location using ssh (remote server)
create_remote_tar_backup() {
    echo "Creating a tarball backup of 'data' and transferring it to a remote server..."
    tar -czvf - data/ | ssh user@remote_server 'cat > /path/to/remote/destination/data_backup.tar.gz'
    echo "Backup created successfully and transferred to remote server."
    echo ""
}

# 7. Use cpio to copy files from a backup to a new directory
copy_files_from_cpio() {
    echo "Copying files from 'data_backup.cpio' to a new directory 'new_data'..."
    mkdir -p new_data
    cpio -id < data_backup.cpio -D new_data/
    echo "Files copied successfully to 'new_data'."
    echo ""
}

# 8. Create a backup using cpio and send the output to a remote server
create_remote_cpio_backup() {
    echo "Creating a cpio backup of 'data' and transferring it to a remote server..."
    find data/ -print | cpio -o | ssh user@remote_server 'cat > /path/to/remote/destination/data_backup.cpio'
    echo "Backup created successfully and transferred to remote server."
    echo ""
}

# 9. List contents of a tar archive without extracting
list_tar_contents() {
    echo "Listing contents of 'data_backup.tar.gz' without extracting..."
    tar -tzvf data_backup.tar.gz
    echo ""
}

# 10. List contents of a cpio archive without extracting
list_cpio_contents() {
    echo "Listing contents of 'data_backup.cpio' without extracting..."
    cpio -it < data_backup.cpio
    echo ""
}

# Menu for user selection
menu() {
    while true; do
        echo "Select an option:"
        echo "1. Create a backup using tar"
        echo "2. Extract a tar archive"
        echo "3. Create a backup using cpio"
        echo "4. Extract a cpio archive"
        echo "5. Create a tar backup with exclusion of specific files"
        echo "6. Create and transfer a remote tar backup"
        echo "7. Copy files from a cpio backup to a new directory"
        echo "8. Create and transfer a remote cpio backup"
        echo "9. List contents of a tar archive"
        echo "10. List contents of a cpio archive"
        echo "11. Exit"
        read choice

        case $choice in
            1) create_tar_backup ;;
            2) extract_tar_backup ;;
            3) create_cpio_backup ;;
            4) extract_cpio_backup ;;
            5) create_tar_with_exclusion ;;
            6) create_remote_tar_backup ;;
            7) copy_files_from_cpio ;;
            8) create_remote_cpio_backup ;;
            9) list_tar_contents ;;
            10) list_cpio_contents ;;
            11) echo "Exiting..."; exit 0 ;;
            *) echo "Invalid option, please try again." ;;
        esac
    done
}

# Call the menu function to run the program
menu

