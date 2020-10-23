import pandas as pd
import pymysql
from sqlalchemy import create_engine

# Credentials to database connection
hostname="129.213.131.233:10"
dbname="censoStaging"
uname="root"
pwd="root"

# Create dataframe
data = pd.read_csv ('TB_AUX_CINE_BRASIL.CSV', delimiter='|',  error_bad_lines=False, encoding='latin-1')   
df = pd.DataFrame(data)

# Create SQLAlchemy engine to connect to MySQL Database
engine = create_engine("mysql+pymysql://{user}:{pw}@{host}/{db}"
                .format(host=hostname, db=dbname, user=uname, pw=pwd))

# Convert dataframe to sql table
df.to_sql('DM_AUX2018', engine, index=False)