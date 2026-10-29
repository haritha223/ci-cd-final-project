#!/bin/bash

# Test Simple Interest Calculation
# principal = 1000, rate = 5, time = 2
# Expected interest = 100

principal=1000
rate=5
time=2

# Calculate simple interest: (principal * rate * time) / 100
interest=$((principal * rate * time / 100))

# Assert the result
if [ "$interest" -eq 100 ]; then
    echo "✓ Test passed: Simple interest calculated correctly"
    echo "  Interest: $interest"
    exit 0
else
    echo "✗ Test failed: Expected 100 but got $interest"
    exit 1
fi
