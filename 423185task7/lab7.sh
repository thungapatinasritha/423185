#!/bin/bash

# Function to initialize a Git repository, commit initial files, and create branches
initialize_git_repo() {
    echo "Initializing Git repository..."
    git init
    echo "This is the first version of the file." > file.txt
    git add file.txt
    git commit -m "Initial commit"
    
    # Create a new branch "feature"
    git checkout -b feature
    echo "This is the feature branch work." > file.txt
    git commit -am "Updated file on feature branch"
    
    # Create another branch "bugfix"
    git checkout -b bugfix
    echo "Fixing bugs on the bugfix branch." > file.txt
    git commit -am "Fixed bugs in bugfix branch"
    
    # Merge bugfix into feature
    git checkout feature
    git merge bugfix -m "Merged bugfix into feature"
    
    # Merge feature into main
    git checkout main
    git merge feature -m "Merged feature into main"
    
    echo "Git repository initialized and branches created and merged."
    echo "Git status:"
    git status
    echo ""
}

# Function to initialize a CVS repository, create branches, and commit changes
initialize_cvs_repo() {
    echo "Initializing CVS repository..."
    mkdir cvs_repo
    cd cvs_repo
    
    # Initialize the CVS repository
    cvs -d $(pwd)/../cvs_repo init
    
    # Checkout the module to start working with it
    cvs -d $(pwd)/../cvs_repo checkout -P project
    
    # Add a new file and commit to the repository
    cd project
    echo "This is the initial commit for CVS." > file.txt
    cvs add file.txt
    cvs commit -m "Initial commit in CVS"
    
    # Create and switch to a branch "feature" in CVS
    cvs tag -b feature
    echo "Work on the feature branch." > file.txt
    cvs commit -m "Work on feature branch"
    
    # Create and switch to a bugfix branch
    cvs tag -b bugfix
    echo "Bug fixes in the bugfix branch." > file.txt
    cvs commit -m "Bug fixes in bugfix branch"
    
    # Merge the bugfix branch into feature branch
    cvs update -j bugfix file.txt
    cvs commit -m "Merged bugfix into feature"
    
    # Merge feature into the main branch
    cvs update -j feature file.txt
    cvs commit -m "Merged feature into main"
    
    echo "CVS repository initialized and branches created and merged."
    cd ../..
    echo ""
}

# Function to print instructions for using the Git and CVS repository
print_instructions() {
    echo "===================================================="
    echo "Instructions for working with Git and CVS:"
    echo ""
    echo "1. Git Commands:"
    echo "   - Initialize Git repository: git init"
    echo "   - Create and switch to a branch: git checkout -b <branch_name>"
    echo "   - Add changes to Git: git add <file_name>"
    echo "   - Commit changes in Git: git commit -m 'message'"
    echo "   - Merge branch into main: git merge <branch_name>"
    echo "   - List branches: git branch"
    echo "   - View commit history: git log"
    echo ""
    echo "2. CVS Commands:"
    echo "   - Initialize CVS repository: cvs -d /path/to/repository init"
    echo "   - Checkout a module: cvs -d /path/to/repository checkout -P project"
    echo "   - Add a new file to CVS: cvs add <file_name>"
    echo "   - Commit to CVS: cvs commit -m 'message'"
    echo "   - Create a branch: cvs tag -b <branch_name>"
    echo "   - Merge branches: cvs update -j <branch_name> <file_name>"
    echo "===================================================="
}

# Main function to run all tasks
main() {
    echo "Starting repository operations..."
    
    # Initialize Git repository, create branches, and merge them
    initialize_git_repo
    
    # Initialize CVS repository, create branches, and merge them
    initialize_cvs_repo
    
    # Print the instructions for using Git and CVS
    print_instructions
}

# Execute main function
main

