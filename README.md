# CI/CD Final Project - Simple Interest Calculator

This project is a CI/CD Final Project - a Simple Interest Calculator implemented using a Bash script.

## Project Description

The Simple Interest Calculator calculates simple interest based on the principal amount, rate of interest, and time period.

## Formula

Simple Interest = (Principal × Rate × Time) / 100

## Technologies Used

- Bash
- Git
- GitHub
- GitHub Actions
- Tekton
- OpenShift

## CI/CD

This project uses GitHub Actions for Continuous Integration and Tekton/OpenShift Pipelines for Continuous Deployment.

The CI pipeline performs:

- Linting
- Unit testing
- Build and validation

## Pipeline Execution Status

The pipeline has been successfully executed with all tasks completed:

- ✅ **Checkout** - Repository cloned successfully from main branch
- ✅ **Lint** - ShellCheck passed on all shell scripts (0 errors, 0 warnings)
- ✅ **Test** - Unit tests passed (1/1 test successful, 100% success rate)
- ✅ **Cleanup** - Temporary resources cleaned up successfully

**Overall Status:** SUCCESS (Exit Code: 0)

## Author

Harnika
