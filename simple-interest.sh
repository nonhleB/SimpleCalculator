#!/bin/bash

# Simple Interest Calculator in Bash
# Formula: Simple Interest = (Principal * Rate * Time) / 100

echo "======================================"
echo "      Simple Interest Calculator      "
echo "======================================"
echo ""

# Input: Principal Amount
read -p "Enter the Principal amount: " principal

# Input: Rate of Interest per annum
read -p "Enter the Annual Rate of Interest (%): " rate

# Input: Time Period
read -p "Enter the Time period (in years): " time

# Validate that inputs are numbers (integers or floating point)
if ! [[ $principal =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
   ! [[ $rate =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
   ! [[ $time =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo ""
    echo "Error: Invalid input. Please enter valid numerical values."
    exit 1
fi

# Calculate Simple Interest and Total Amount using 'bc' for floating-point precision
interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)
total=$(echo "scale=2; $principal + $interest" | bc)

echo ""
echo "--------------------------------------"
echo "               Results                "
echo "--------------------------------------"
echo "Principal Amount : $principal"
echo "Interest Rate    : $rate%"
echo "Time Period      : $time year(s)"
echo "--------------------------------------"
echo "Simple Interest  : $interest"
echo "Total Amount     : $total"
echo "======================================"
