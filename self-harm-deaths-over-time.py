import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import mysql.connector 
from mysql.connector import Error

cnx = mysql.connector.connect(port="3306",host="localhost",user="root", password="Kv146367*-sarpi", database="causesofdeath")

# creating cursor
cursor = cnx.cursor()

# execute the SQL query to fetch data from the view
cursor.execute("SELECT * FROM high_selfharm_activity")

# fetching all the rows
data = cursor.fetchall()

# creating a pandas DataFrame from the data
df = pd.DataFrame(data, columns=["s_name", "s_code", "s_year", "s_death", "s_id"])

# make sure that 's_year' and 's_death' are of type int/float for plotting
df['s_year'] = df['s_year'].astype(int)
df['s_death'] = df['s_death'].astype(float)

# sorting the dataframe by year
df = df.sort_values('s_year')

# creating an area chart
plt.fill_between(df['s_year'], df['s_death'], color="skyblue", alpha=0.4)
plt.plot(df['s_year'], df['s_death'], color="Slateblue", alpha=0.6)

plt.title('Self-harm Deaths Over Time')
plt.xlabel('Year')
plt.ylabel('Number of Deaths')

plt.show()