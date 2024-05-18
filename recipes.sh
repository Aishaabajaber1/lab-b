#!/bin/bash

# Initialize recipe database file if not exists
database_file="recipes.txt"
touch "$database_file"

# Function to display menu
display_menu() {
    echo "Recipe Database"
    echo "1. Add Recipe"
    echo "2. View Recipes"
    echo "3. Search Recipes"
    echo "4. Exit"
    echo "Enter your choice: "
}

# Function to add recipe
add_recipe() {
    echo "Enter the name of the recipe: "
    read name
    echo "Enter the ingredients for $name (comma-separated): "
    read ingredients
    echo "Enter the instructions for $name: "
    read instructions

    echo "$name|$ingredients|$instructions" >> "$database_file"
    echo "Recipe added successfully!"
}

# Function to view recipes
view_recipes() {
    echo "Recipes:"
    cat "$database_file"
}

# Function to search recipes
search_recipes() {
    echo "Enter a keyword to search for: "
    read keyword

    grep -i "$keyword" "$database_file"
}

# Main script
while true; do
    display_menu
    read choice

    case $choice in
        1) add_recipe ;;
        2) view_recipes ;;
        3) search_recipes ;;
        4) echo "Exiting..."; break ;;
        *) echo "Invalid choice. Please enter a valid option." ;;
    esac
done
