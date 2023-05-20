import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import mysql.connector 
from mysql.connector import Error

cnx = mysql.connector.connect(port="3306",host="localhost",user="root", password="Kv146367*-sarpi", database="causesofdeath")

# Fetch data from the view
query = "SELECT * FROM high_terrorism_activity"
df = pd.read_sql(query, cnx)

# Close the database connection
cnx.close()

# Now df is a DataFrame containing data from your view                                                                                                           # grouping by 't_name' and summing 't_death'
grouped_df = df.groupby('t_name')['t_death'].sum().reset_index()

# sort dataframe in descending order
grouped_df = grouped_df.sort_values(by='t_death', ascending=False)
# Select top 20 countries
top_countries = grouped_df.nlargest(20, 't_death')

plt.figure(figsize=(10,10))
plt.barh(top_countries['t_name'], top_countries['t_death'], color='skyblue')
plt.xlabel('Sum of Terrorism Fatalities')
plt.ylabel('Country')
plt.title('Top 20 Countries by Sum of Terrorism Fatalities')
plt.gca().invert_yaxis()
plt.show()