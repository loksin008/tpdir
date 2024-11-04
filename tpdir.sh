#!/bin/bash

# Path to the directory database file
DIRECTORY="directory.txt"

# Function to add a new contact
add_contact() {
    read -rp "Enter Name: " name
    read -rp "Enter Phone Number: " phone
    echo "$name, $phone" >> "$DIRECTORY"
    echo "Contact added successfully."
}

# Function to search for a contact by name
search_contact() {
    read -rp "Enter Name to search: " name
    result=$(grep -i "^$name," "$DIRECTORY")
    if [[ -n $result ]]; then
        echo "Contact(s) found:"
        echo "-----------------"
        echo "$result"
    else
        echo "No contact found with the name '$name'."
    fi
}

# Function to delete a contact by name
delete_contact() {
    read -rp "Enter Name to delete: " name
    if grep -iq "^$name," "$DIRECTORY"; then
        grep -iv "^$name," "$DIRECTORY" > temp.txt && mv temp.txt "$DIRECTORY"
        echo "Contact deleted successfully."
    else
        echo "No contact found with the name '$name'."
    fi
}

# Main menu function
show_menu() {
    echo "Telephone Directory"
    echo "-------------------"
    echo "1. Add Contact"
    echo "2. Search Contact"
    echo "3. Delete Contact"
    echo "4. Exit"
}

# Main program loop
while true; do
    show_menu
    read -rp "Choose an option: " choice
    case $choice in
        1) add_contact ;;
        2) search_contact ;;
        3) delete_contact ;;
        4) echo "Exiting the telephone directory."; break ;;
        *) echo "Invalid option. Please try again." ;;
    esac
    echo ""
done
