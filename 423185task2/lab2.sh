#!/bin/bash

# Question 1: List all files that start with the letter 'a'
echo "Files starting with 'a':"
ls a*
echo ""

# Question 2: List all files with a .txt extension
echo "Files with .txt extension:"
ls *.txt
echo ""

# Question 3: Find all files whose names have exactly five characters
echo "Files with exactly 5 characters:"
ls ??????
echo ""

# Question 4: List files that start with any letter between b and e
echo "Files starting with letters between 'b' and 'e':"
ls [b-e]*
echo ""

# Question 5: List files that end with .log where the second character is a number
echo "Files ending with .log and second character is a number:"
ls [a-zA-Z][0-9]*.log
echo ""

