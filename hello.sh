#!/bin/bash

# Initialize invoice file if not exists
invoice_file="invoices.txt"
touch "$invoice_file"

# Function to display menu
display_menu() {
    echo "Billing and Invoicing System"
    echo "1. Generate Invoice"
    echo "2. View Invoices"
    echo "3. Exit"
    echo "Enter your choice: "
}

# Function to generate invoice
generate_invoice() {
    echo "Enter customer name: "
    read customer_name
    echo "Enter amount: "
    read amount

    invoice_number=$(date +%Y%m%d%H%M%S)
    echo "Invoice Number: $invoice_number" >> "$invoice_file"
    echo "Customer Name: $customer_name" >> "$invoice_file"
    echo "Amount: $amount" >> "$invoice_file"
    echo "Invoice generated successfully!"
}

# Function to view invoices
view_invoices() {
    echo "Invoices:"
    cat "$invoice_file"
}

# Main script
while true; do
    display_menu
    read choice

    if [ "$choice" -eq 1 ]; then
        generate_invoice
    elif [ "$choice" -eq 2 ]; then
        view_invoices
    elif [ "$choice" -eq 3 ]; then
        echo "Exiting..."
        break
    else
        echo "Invalid choice. Please enter a valid option."
    fi
done
