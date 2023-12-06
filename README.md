# College Stats Database Interface

This program provides a simple interface to interact with a college statistics database. It allows users to retrieve information about college teams, their seasonal stats, and the average performance grades of players.

## Setup

1. **Database Configuration:**
   - Ensure you have a MySQL database named "STATS" set up.
   - Modify the `main()` function in the script to provide your MySQL server details.

   ```python
   host = "localhost"
   user = input("Enter username: ")
   password = getpass("Enter password: ")
   database = "STATS"

2. **Execution:**
   - Open up a terminal and execute.

   `bash
   python your_script_name.py
   `

## Usage

1. **Search for a College:**
   - Enter the name of the college you want to retrieve information for.

2. **Select Query Type:**
   - Choose the type of information you want to retrieve:
     - Team Info
     - Team Seasonal Stats
     - Average Performance Grades

3. **View Results:**
   - The script will display the results based on your selection.

## Important Notes

- **SQL Injection:**
  - The code uses parameterized queries to prevent SQL injection. However, always validate and sanitize user input for security.

- **User Interface:**
  - The program is designed to be simple. You can customize the interface based on your preferences and requirements.

- **Error Handling:**
  - Any errors encountered during execution will be displayed. Ensure proper database connectivity and configuration.

## Additional Customization

Feel free to customize the code based on your specific needs. You can add more queries, improve the user interface, or extend the functionality as required.
