#!/bin/bash

# Function to check if a number is even or odd
even_or_odd() {
    echo "Enter a number to check if it's even or odd:"
    read number
    if ((number % 2 == 0)); then
        echo "$number is Even"
    else
        echo "$number is Odd"
    fi
}

# Function to check if a year is a leap year
leap_year() {
    echo "Enter a year to check if it's a leap year:"
    read year
    if ((year % 400 == 0)) || ((year % 4 == 0 && year % 100 != 0)); then
        echo "$year is a Leap Year"
    else
        echo "$year is not a Leap Year"
    fi
}

# Function to find the factorial of a number
factorial() {
    echo "Enter a number to find its factorial:"
    read num
    fact=1
    for ((i=1; i<=num; i++)); do
        fact=$((fact * i))
    done
    echo "Factorial of $num is $fact"
}

# Function to swap two integers
swap_numbers() {
    echo "Enter first number:"
    read num1
    echo "Enter second number:"
    read num2

    echo "Before swapping: num1 = $num1, num2 = $num2"
    temp=$num1
    num1=$num2
    num2=$temp
    echo "After swapping: num1 = $num1, num2 = $num2"
}

# Function to compute GCD and LCM of two numbers
gcd_lcm() {
    echo "Enter first number:"
    read a
    echo "Enter second number:"
    read b

    # Finding GCD using Euclidean algorithm
    x=$a
    y=$b
    while ((y != 0)); do
        temp=$y
        y=$((x % y))
        x=$temp
    done
    gcd=$x

    # Finding LCM using the formula: LCM(a, b) = (a * b) / GCD(a, b)
    lcm=$(( (a * b) / gcd ))

    echo "GCD of $a and $b is $gcd"
    echo "LCM of $a and $b is $lcm"
}

# Menu for user selection
menu() {
    while true; do
        echo ""
        echo "Select an option:"
        echo "1. Check if a number is even or odd"
        echo "2. Check if a year is a leap year"
        echo "3. Find the factorial of a number"
        echo "4. Swap two integers"
        echo "5. Compute GCD & LCM of two numbers"
        echo "6. Exit"
        read choice

        case $choice in
            1) even_or_odd ;;
            2) leap_year ;;
            3) factorial ;;
            4) swap_numbers ;;
            5) gcd_lcm ;;
            6) echo "Exiting..."; exit 0 ;;
            *) echo "Invalid option, please try again." ;;
        esac
    done
}

# Call the menu function to run the program
menu

