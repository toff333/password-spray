# Password Spraying PowerShell Script

This PowerShell script allows you to perform password spraying against a domain using a list of usernames and a single password. It checks each username with the provided password and exports the results to a CSV file.

## Prerequisites
- Windows PowerShell
- Access to the domain for authentication

## Usage

1. **Download the Script**: Download the `password_spray.ps1` script from this repository.

2. **Prepare Usernames List**: Create a text file containing the list of usernames you want to test. Each username should be on a separate line. Save this file as `usernames.txt`.

3. **Run the Script**:
   - Open PowerShell.
   - Navigate to the directory where the script is located.
   - Run the script using the following command:
     ```powershell
     .\password_spray.ps1 -ul "usernames.txt" -p "yourpassword" -o "output.csv"
     ```
     - Replace `"usernames.txt"` with the path to your usernames list file.
     - Replace `"yourpassword"` with the password you want to test.
     - Replace `"output.csv"` with the desired path for the output CSV file.

4. **Review Results**: Once the script finishes running, you will find the results in the output CSV file specified.

## Parameters
- `-ul`: Path to the usernames list file.
- `-p`: Password to be tested.
- `-o`: Path to the output CSV file.

## Example
```powershell
.\password_spray.ps1 -ul "C:\Users\user\Documents\usernames.txt" -p "MyComplexPassword123" -o "C:\Users\user\Documents\output.csv"
```
