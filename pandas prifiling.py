import pandas as pd
from pandas_profiling import profilerepor
df=pd.read_excel("E:/Data Analyst Test/Gringotts Wizarding Bank.xlsx,sheet_name=applications")
print(df.head())