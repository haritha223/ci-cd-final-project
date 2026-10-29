#!/bin/bash

echo "Enter Principal:"
read -r principal

echo "Enter Rate of Interest:"
read -r rate

echo "Enter Time Period:"
read -r time

simple_interest=$((principal * rate * time / 100))

echo "Simple Interest = $simple_interest"
