import pandas as pd
import msno


# Load the "applications" sheet from Excel file into a DataFrame
applications = pd.read_excel("Gringotts Wizarding Bank.xlsx",sheet_name="customers")

# Display the first 5 rows of the "customers" DataFrame
print(customers.head())

# Get summary statistics for the numeric columns
print(customers.describe())

# Check for missing values in the DataFrame
print(customers.isnull().sum())

# Explore the distribution of the age column
import matplotlib.pyplot as plt
plt.hist(customers['age'], bins=30)
plt.xlabel('Age')
plt.ylabel('Count')
plt.show()

# Explore the relationship between age and income columns
plt.scatter(customers['age'], customers['income'])
plt.xlabel('Age')
plt.ylabel('Income')
plt.show()

# Explore the distribution of gender column
customers['gender'].value_counts().plot(kind='bar')
plt.xlabel('Gender')
plt.ylabel('Count')
plt.show()

# Explore the distribution of marital_status column
customers['marital_status'].value_counts().plot(kind='bar')
plt.xlabel('Marital Status')
plt.ylabel('Count')
plt.show()

# Explore the distribution of education column
customers['education'].value_counts().plot(kind='bar')
plt.xlabel('Education')
plt.ylabel('Count')
plt.show()