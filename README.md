# Password Spraying PowerShell Script

This PowerShell script enables password spraying attacks by attempting to authenticate a list of users using a list of passwords against a specified domain. It's a tool commonly used in penetration testing and security assessments to identify weak passwords and potential vulnerabilities in authentication systems.

## Usage

1. **Prepare User and Password Lists**: Prepare your user list and password list. Each should be a text file containing one entry per line. These files will be used as inputs for the script.

2. **Run the Script**: Execute the script with PowerShell, providing the paths to your user list, password list, and the desired output CSV file. Use the following command format:

   ```powershell
   .\PasswordSpray.ps1 -UserListPath <path_to_user_list> -PasswordListPath <path_to_password_list> -OutputFilePath <output_csv_path>
   ```

   Replace `<path_to_user_list>`, `<path_to_password_list>`, and `<output_csv_path>` with the respective paths on your system.

3. **Review the Output**: Once the script completes, review the generated CSV file to analyze the authentication results for each user-password combination.

## Arguments

- **-UserListPath**: Path to the text file containing the list of usernames.
- **-PasswordListPath**: Path to the text file containing the list of passwords.
- **-OutputFilePath**: Path to the output CSV file where the results will be saved.

## Output

The script generates a CSV file containing the following columns:

- **Username**: The username from the user list.
- **Password**: The password from the password list.
- **Status**: The authentication status, indicating whether the attempt was successful or failed.

