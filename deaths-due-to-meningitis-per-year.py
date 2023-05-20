import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import mysql.connector 
from mysql.connector import Error

cnx = mysql.connector.connect(port="3306",host="localhost",user="root", password="Kv146367*-sarpi", database="causesofdeath")


# Create a pandas dataframe from a SQL query
df = pd.read_sql_query("SELECT * FROM low_disease_death", cnx)

# Close the database connection
cnx.close()

# Let's visualize the number of deaths due to meningitis per year, as an example
grouped_df = df.groupby('d_year')['d_meningitis'].sum().reset_index()

# Set the theme
sns.set_theme(style="whitegrid")

# Create the bar plot
plt.figure(figsize=(10, 6))
ax = sns.barplot(x='d_year', y='d_meningitis', data=grouped_df, ci=None, color='b')

# Set title and labels for the chart
ax.set_title("Deaths due to Meningitis per Year", fontsize=15)
ax.set_xlabel("Year", fontsize=12)
ax.set_ylabel("Number of Deaths", fontsize=12)

# Rotate x-axis labels for better visibility
plt.xticks(rotation=45)

plt.show()



