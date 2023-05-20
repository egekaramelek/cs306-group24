import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import mysql.connector 
from mysql.connector import Error

cnx = mysql.connector.connect(port="3306",host="localhost",user="root", password="Kv146367*-sarpi", database="causesofdeath")

# Define your SQL query to fetch the data from your view
query = "SELECT * FROM high_nature_death"

# Read the data from MySQL into a pandas DataFrame
df = pd.read_sql_query(query, cnx)



# Plot scatter plots
plt.scatter(df['f_year'], df['f_death'])
plt.xlabel('Year')
plt.ylabel('Death')
plt.title('Exposure to Forces of Nature - Scatter Plot')
#Modify the range as per your data
plt.ylim(0, 300)  # Modify the range as per your data

plt.show()