#!/bin/bash

# 1. Given a log file with the format: [Timestamp] [Log Level] [Module] [Message]
#    Write an awk command to extract only ERROR messages along with their timestamps.
extract_error_messages() {
    echo "Extracting ERROR messages with their timestamps from log.txt:"
    awk '/ERROR/ {print $1, $2, $3, $4, $5}' log.txt
    echo ""
}

# 2. Given a CSV file with tab-separated values:
#    Write an awk script to compute the average of each subject (Math, Science, English).
compute_averages() {
    echo "Computing the average of each subject from CSV file (data.csv):"
    awk 'BEGIN {math_sum=0; science_sum=0; english_sum=0; count=0} 
    NR > 1 {math_sum+=$2; science_sum+=$3; english_sum+=$4; count++} 
    END {print "Math Average: " math_sum/count "\nScience Average: " science_sum/count "\nEnglish Average: " english_sum/count}' data.csv
    echo ""
}

# 3. Given a server log with IP addresses:
#    Write an awk script to count occurrences of each IP.
count_ip_occurrences() {
    echo "Counting occurrences of each IP address in server_log.txt:"
    awk '{print $1}' server_log.txt | sort | uniq -c | sort -nr
    echo ""
}

# 4. Given lines of text: apple banana cherry, dog cat elephant
#    Write a sed command to swap the first and last words.
swap_first_last_words() {
    echo "Swapping the first and last words in lines of text (text.txt):"
    sed -E 's/^([^ ]+) ([^ ]+) ([^ ]+)$/\3 \2 \1/' text.txt
    echo ""
}

# 5. Given a file with duplicate words: hello hello worldthis is is a test test
#    Write a sed command to remove consecutive duplicate words.
remove_consecutive_duplicates() {
    echo "Removing consecutive duplicate words in file (duplicate.txt):"
    sed 's/\b\([[:alnum:]]\+\) \1\b/\1/g' duplicate.txt
    echo ""
}

# Menu for user selection
menu() {
    while true; do
        echo "Select an option:"
        echo "1. Extract ERROR messages with timestamps"
        echo "2. Compute the average of each subject from CSV"
        echo "3. Count occurrences of each IP in the server log"
        echo "4. Swap the first and last words in lines of text"
        echo "5. Remove consecutive duplicate words"
        echo "6. Exit"
        read choice

        case $choice in
            1) extract_error_messages ;;
            2) compute_averages ;;
            3) count_ip_occurrences ;;
            4) swap_first_last_words ;;
            5) remove_consecutive_duplicates ;;
            6) echo "Exiting..."; exit 0 ;;
            *) echo "Invalid option, please try again." ;;
        esac
    done
}

# Call the menu function to run the program
menu

