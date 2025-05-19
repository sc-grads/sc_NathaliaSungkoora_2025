/* Practice Activity Number 5 */


select [name]
from sys.all_columns

-- Question 1: Add the letter A to the end of each name.
SELECT name + 'A' AS Question1
FROM sys.all_columns;

-- Question 2: Append Unicode 'Ⱥ' to column names
SELECT name+ N'Ⱥ' AS Question2
FROM sys.all_columns;

-- Question 3: Remove the first character from column names
SELECT SUBSTRING([name], 2, LEN([name]) - 1) AS Question3
FROM sys.all_columns;

-- Question 4: Remove the last character from column names
SELECT SUBSTRING([name], 1, LEN([name]) - 1) AS Question4
FROM sys.all_columns;
