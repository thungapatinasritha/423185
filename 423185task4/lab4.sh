#!/bin/bash

# 1. Find all lines containing the word "error" in a log file (log.txt).
find_error_lines() {
    echo "Finding lines containing the word 'error' in log.txt:"
    grep -i "error" log.txt
    echo ""
}

# 2. Count the occurrences of the word "success" in a file (data.txt).
count_success_occurrences() {
    echo "Counting occurrences of the word 'success' in data.txt:"
    grep -o -i "success" data.txt | wc -l
    echo ""
}

# 3. Extract all lines from a file (records.txt) that start with a digit.
extract_lines_starting_with_digit() {
    echo "Extracting lines starting with a digit from records.txt:"
    grep '^[0-9]' records.txt
    echo ""
}

# 4. Display all lines in file.txt that do not contain the word "failed".
display_lines_without_failed() {
    echo "Displaying lines in file.txt that do not contain the word 'failed':"
    grep -iv "failed" file.txt
    echo ""
}

# 5. Find all .txt files in the current directory that contain the word "TODO".
find_txt_files_with_todo() {
    echo "Finding .txt files in the current directory that contain the word 'TODO':"
    grep -l -i "TODO" *.txt
    echo ""
}

# Menu for user selection
menu() {
    while true; do
        echo "Select an option:"
        echo "1. Find lines containing the word 'error' in log.txt"
        echo "2. Count occurrences of the word 'success' in data.txt"
        echo "3. Extract lines starting with a digit from records.txt"
        echo "4. Display lines without the word 'failed' in file.txt"
        echo "5. Find .txt files with the word 'TODO' in the current directory"
        echo "6. Exit"
        read choice

        case $choice in
            1) find_error_lines ;;
            2) count_success_occurrences ;;
            3) extract_lines_starting_with_digit ;;
            4) display_lines_without_failed ;;
            5) find_txt_files_with_todo ;;
            6) echo "Exiting..."; exit 0 ;;
            *) echo "Invalid option, please try again." ;;
        esac
    done
}

# Call the menu function to run the program
menu

