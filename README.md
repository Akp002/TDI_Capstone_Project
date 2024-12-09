# TDI Capstone Project: Automated Data Integration

## Project Overview
This project addresses inefficiencies in manual data integration processes by automating the consolidation of large datasets submitted by applicants for specific cohorts. Using Bash scripting and GitHub Actions, the Data integration workflow ensures timely and scalable processing of approximately 10,000 daily applications.

The automated pipeline integrates multiple datasets into a single file, saving time and eliminating delays caused by manual processes.

### Key Features

* Automated Dataset Integration: Combines multiple CSV files from the data-hub folder into a single consolidated file.
* GitHub Actions Trigger: Automatically runs the Data integration script whenever changes are pushed to the repository.
* Scalable Solution: Efficiently handles growing data volumes.
* Output Validation: Ensures accuracy in the integrated output file.
  
## Project Structure

TDI_Capstone_Project/

├── data-hub/                     # Folder containing input CSV files

│   ├── data1.csv

│   ├── data2.csv

│   ├── data3.csv

├── db/                           # Folder for storing the final integrated output

│   └── data.csv

├── Scripts/

│   └── Data_integration.sh       # Bash script for data integration

├── .github/

│   └── workflows/

│       └── data_integration.yaml  # GitHub Actions workflow configuration

└── README.md                     # Project documentation

## Prerequisites
Before running this project, ensure the following:

* Git and GitHub:
Git is installed on your system.
A GitHub repository is created for this project.

* CSV Data:
Place the input CSV files in the data-hub/ directory.
Ensure each file follows the same structure (same headers).
Environment:

* Linux-based system or a compatible terminal (ubuntu).

## Setup Instructions

1. Clone the Repository
Clone the repository to your local machine:
git clone https://github.com/your-username/TDI_Capstone_Project.git
cd TDI_Capstone_Project

2. Add Input Data
Place all input CSV files into the data-hub/ folder.

3. Run the Script Locally
Run the Bash script to manually test the integration:

chmod +x Script/Data_integration.sh
./Script/Data_integration.sh

Checks for the existence of the data-hub/ folder.
Merges all CSV files into a single data.csv file located in the db/ folder.
4. Commit and Push Changes
After running the script locally:

git add .
git commit -m "Added integrated data output"
git push origin main

5. Set Up GitHub Actions
The GitHub Actions workflow (.github/workflows/data_integration.yml) is already configured. It:

Runs the Bash script whenever changes are pushed to the repository.
Automatically updates the db/data.csv file.
To manually trigger the workflow:

Go to the Actions tab in your repository.
Select the "Data Integration" workflow.

Click Run workflow.

* How It Works
Bash Script (Data_integration.sh)
Input Folder: The script looks for CSV files in the data-hub/ folder.

Output Folder: The final integrated file is saved in the db/ folder as data.csv.

Header Handling: The script includes the header from the first file and appends data from subsequent files.

The GitHub Actions workflow (data_integration.yml) automates the script execution. It:

Triggers:
On every push to the main branch.
Manually via the Actions tab.
Steps:
Checks out the repository code.
Grants execution permissions to the Bash script.
Runs the script to integrate data.
Workflow Log Example:

Processing file: ./data-hub/data1.csv
Processing file: ./data-hub/data2.csv
Processing file: ./data-hub/data3.csv
Data integration complete! Output saved in './db/data.csv'.

## Common Issues and Troubleshooting
1. Missing data-hub Folder
Error:

The folder './data-hub' not found!!
Solution:

Ensure the data-hub/ folder exists and contains CSV files.
2. Workflow Fails on GitHub
Error:

No CSV files found in './data-hub'
Solution:

Verify the data-hub/ folder and its contents are committed to the repository:

git add data-hub/
git commit -m "Add data files"
git push origin main

3. Permissions Error
Error:

Copy code
Permission denied
Solution:

Ensure the script has execution permissions:
bash
Copy code
chmod +x Scripts/Data_integration.sh

Contributors
Obor Akpevweoghene, oborakpevwe@gmail.com
TDI Community: Guidance and support

## Future Enhancements
Add validation for CSV structures (e.g., matching headers).
Automate email notifications on workflow completion.
Extend the script to handle other data formats (e.g., JSON, Excel).

## License
This project is licensed under the MIT License. 

