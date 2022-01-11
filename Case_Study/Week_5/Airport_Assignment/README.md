### Problem Statement: Analyse flight delay information-based input datasets


```python
import json
import pandas as pd
import numpy as np
```


```python
#loading airport.json into DataFrame
df=pd.read_json('airports.json')
```


```python
#let see the rows of DataFrame
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>code</th>
      <th>lat</th>
      <th>lon</th>
      <th>name</th>
      <th>city</th>
      <th>state</th>
      <th>country</th>
      <th>woeid</th>
      <th>tz</th>
      <th>phone</th>
      <th>type</th>
      <th>email</th>
      <th>url</th>
      <th>runway_length</th>
      <th>elev</th>
      <th>icao</th>
      <th>direct_flights</th>
      <th>carriers</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>AAA</td>
      <td>-17.3595</td>
      <td>-145.49400</td>
      <td>Anaa Airport</td>
      <td>Anaa</td>
      <td>Tuamotu-Gambier</td>
      <td>French Polynesia</td>
      <td>12512819</td>
      <td>Pacific/Midway</td>
      <td></td>
      <td>Airports</td>
      <td></td>
      <td></td>
      <td>4921.0</td>
      <td>7.0</td>
      <td>NTGA</td>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>AAE</td>
      <td>36.8236</td>
      <td>7.81030</td>
      <td>El Mellah Airport</td>
      <td>El Tarf</td>
      <td>Annaba</td>
      <td>Algeria</td>
      <td>12510325</td>
      <td>Africa/Algiers</td>
      <td></td>
      <td>Airports</td>
      <td></td>
      <td></td>
      <td>9843.0</td>
      <td>16.0</td>
      <td>DABB</td>
      <td>6</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>AAL</td>
      <td>57.0952</td>
      <td>9.85606</td>
      <td>Aalborg Airport</td>
      <td>Norresundby</td>
      <td>Nordjylland</td>
      <td>Denmark</td>
      <td>12512587</td>
      <td>Europe/Copenhagen</td>
      <td></td>
      <td>Airports</td>
      <td></td>
      <td>http://www.aal.dk/</td>
      <td>8700.0</td>
      <td>10.0</td>
      <td>EKYT</td>
      <td>7</td>
      <td>10</td>
    </tr>
    <tr>
      <th>3</th>
      <td>AAM</td>
      <td>-24.8000</td>
      <td>31.53330</td>
      <td>Mala Mala</td>
      <td>Mala Mala</td>
      <td></td>
      <td>South Africa</td>
      <td>55921381</td>
      <td>Africa/Johannesburg</td>
      <td></td>
      <td>Airports</td>
      <td></td>
      <td></td>
      <td>4420.0</td>
      <td>1200.0</td>
      <td>FAMD</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>AAN</td>
      <td>24.2500</td>
      <td>55.75000</td>
      <td>Al Ain Airport</td>
      <td>Ayn al Faydah</td>
      <td>Abu Dhabi</td>
      <td>United Arab Emirates</td>
      <td>12523371</td>
      <td>Asia/Dubai</td>
      <td></td>
      <td>Airports</td>
      <td></td>
      <td></td>
      <td>NaN</td>
      <td>NaN</td>
      <td>OMAL</td>
      <td>12</td>
      <td>9</td>
    </tr>
  </tbody>
</table>
</div>



 ##### Data Cleansing - Write a python function/functions for data cleansing process


```python
def clean_df(dt):
    for i in dt:
        if(dt[i].dtypes==object):
            dt[i]=dt[i].replace(to_replace=['',np.nan,None],value='BLANK')
        elif(dt[i].dtypes==int):
            dt[i]=dt[i].replace(to_replace=['',np.nan,None],value=0)
        elif(dt[i].dtypes==float):
            dt[i]=dt[i].replace(to_replace=['',np.nan,None],value=0.0)
        #else:
            #print("Your Dataframe column does not contain above data type ,please assign proper datatype")
    return dt
```


```python
#lets save our cleaned DataFrame into cleaned_DF variable
cleaned_DF=clean_df(df)
```


```python
#First 5 rows of cleaned_DataFrame
cleaned_DF.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>code</th>
      <th>lat</th>
      <th>lon</th>
      <th>name</th>
      <th>city</th>
      <th>state</th>
      <th>country</th>
      <th>woeid</th>
      <th>tz</th>
      <th>phone</th>
      <th>type</th>
      <th>email</th>
      <th>url</th>
      <th>runway_length</th>
      <th>elev</th>
      <th>icao</th>
      <th>direct_flights</th>
      <th>carriers</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>AAA</td>
      <td>-17.3595</td>
      <td>-145.49400</td>
      <td>Anaa Airport</td>
      <td>Anaa</td>
      <td>Tuamotu-Gambier</td>
      <td>French Polynesia</td>
      <td>12512819</td>
      <td>Pacific/Midway</td>
      <td>BLANK</td>
      <td>Airports</td>
      <td>BLANK</td>
      <td>BLANK</td>
      <td>4921.0</td>
      <td>7.0</td>
      <td>NTGA</td>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>AAE</td>
      <td>36.8236</td>
      <td>7.81030</td>
      <td>El Mellah Airport</td>
      <td>El Tarf</td>
      <td>Annaba</td>
      <td>Algeria</td>
      <td>12510325</td>
      <td>Africa/Algiers</td>
      <td>BLANK</td>
      <td>Airports</td>
      <td>BLANK</td>
      <td>BLANK</td>
      <td>9843.0</td>
      <td>16.0</td>
      <td>DABB</td>
      <td>6</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>AAL</td>
      <td>57.0952</td>
      <td>9.85606</td>
      <td>Aalborg Airport</td>
      <td>Norresundby</td>
      <td>Nordjylland</td>
      <td>Denmark</td>
      <td>12512587</td>
      <td>Europe/Copenhagen</td>
      <td>BLANK</td>
      <td>Airports</td>
      <td>BLANK</td>
      <td>http://www.aal.dk/</td>
      <td>8700.0</td>
      <td>10.0</td>
      <td>EKYT</td>
      <td>7</td>
      <td>10</td>
    </tr>
    <tr>
      <th>3</th>
      <td>AAM</td>
      <td>-24.8000</td>
      <td>31.53330</td>
      <td>Mala Mala</td>
      <td>Mala Mala</td>
      <td>BLANK</td>
      <td>South Africa</td>
      <td>55921381</td>
      <td>Africa/Johannesburg</td>
      <td>BLANK</td>
      <td>Airports</td>
      <td>BLANK</td>
      <td>BLANK</td>
      <td>4420.0</td>
      <td>1200.0</td>
      <td>FAMD</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>AAN</td>
      <td>24.2500</td>
      <td>55.75000</td>
      <td>Al Ain Airport</td>
      <td>Ayn al Faydah</td>
      <td>Abu Dhabi</td>
      <td>United Arab Emirates</td>
      <td>12523371</td>
      <td>Asia/Dubai</td>
      <td>BLANK</td>
      <td>Airports</td>
      <td>BLANK</td>
      <td>BLANK</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>OMAL</td>
      <td>12</td>
      <td>9</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Lets see the Last 5 rows of cleaned_DataFrame
cleaned_DF.tail()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>code</th>
      <th>lat</th>
      <th>lon</th>
      <th>name</th>
      <th>city</th>
      <th>state</th>
      <th>country</th>
      <th>woeid</th>
      <th>tz</th>
      <th>phone</th>
      <th>type</th>
      <th>email</th>
      <th>url</th>
      <th>runway_length</th>
      <th>elev</th>
      <th>icao</th>
      <th>direct_flights</th>
      <th>carriers</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>3880</th>
      <td>ZYP</td>
      <td>40.7501</td>
      <td>40.75010</td>
      <td>Penn Station</td>
      <td>New York</td>
      <td>New York</td>
      <td>United States</td>
      <td>23682829</td>
      <td>America/New_York</td>
      <td>BLANK</td>
      <td>Railway Stations</td>
      <td>BLANK</td>
      <td>BLANK</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>BLANK</td>
      <td>5</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3881</th>
      <td>ZYQ</td>
      <td>43.0500</td>
      <td>-76.14740</td>
      <td>Syracuse</td>
      <td>Syracuse</td>
      <td>New York</td>
      <td>United States</td>
      <td>2503418</td>
      <td>America/New_York</td>
      <td>BLANK</td>
      <td>Railway Stations</td>
      <td>BLANK</td>
      <td>BLANK</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>BLANK</td>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3882</th>
      <td>ZYR</td>
      <td>50.8346</td>
      <td>4.33628</td>
      <td>Brussels Midi Railway Station</td>
      <td>Brussels</td>
      <td>Vlaams Brabant</td>
      <td>Belgium</td>
      <td>968019</td>
      <td>Europe/Brussels</td>
      <td>BLANK</td>
      <td>Railway Stations</td>
      <td>BLANK</td>
      <td>BLANK</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>BLANK</td>
      <td>9</td>
      <td>7</td>
    </tr>
    <tr>
      <th>3883</th>
      <td>ZYZ</td>
      <td>51.1992</td>
      <td>4.43246</td>
      <td>Berchem Railway Stn.</td>
      <td>Antwerp</td>
      <td>Flanders</td>
      <td>Belgium</td>
      <td>12817574</td>
      <td>Europe/Brussels</td>
      <td>BLANK</td>
      <td>Railway Stations</td>
      <td>BLANK</td>
      <td>BLANK</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>BLANK</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3884</th>
      <td>TNM</td>
      <td>-81.5000</td>
      <td>0.00000</td>
      <td>Teniente R. Marsh Airport</td>
      <td>Teniente R. Marsh</td>
      <td>BLANK</td>
      <td>Antarctica</td>
      <td>28289409</td>
      <td>Antarctica/South_Pole</td>
      <td>BLANK</td>
      <td>Airports</td>
      <td>BLANK</td>
      <td>BLANK</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>BLANK</td>
      <td>0</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Chek the shape of DataFrame
cleaned_DF.shape
```




    (3885, 18)




```python
cleaned_DF.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 3885 entries, 0 to 3884
    Data columns (total 18 columns):
     #   Column          Non-Null Count  Dtype  
    ---  ------          --------------  -----  
     0   code            3885 non-null   object 
     1   lat             3885 non-null   float64
     2   lon             3885 non-null   float64
     3   name            3885 non-null   object 
     4   city            3885 non-null   object 
     5   state           3885 non-null   object 
     6   country         3885 non-null   object 
     7   woeid           3885 non-null   int64  
     8   tz              3885 non-null   object 
     9   phone           3885 non-null   object 
     10  type            3885 non-null   object 
     11  email           3885 non-null   object 
     12  url             3885 non-null   object 
     13  runway_length   3885 non-null   float64
     14  elev            3885 non-null   float64
     15  icao            3885 non-null   object 
     16  direct_flights  3885 non-null   int64  
     17  carriers        3885 non-null   int64  
    dtypes: float64(4), int64(3), object(11)
    memory usage: 546.5+ KB
    


```python
#Now chek the NUll value present in DataFrame 
cleaned_DF.isnull().sum()
```




    code              0
    lat               0
    lon               0
    name              0
    city              0
    state             0
    country           0
    woeid             0
    tz                0
    phone             0
    type              0
    email             0
    url               0
    runway_length     0
    elev              0
    icao              0
    direct_flights    0
    carriers          0
    dtype: int64




```python
#lets save our cleaned data into CSV on our local system
cleaned_DF.to_csv('cleaned_airport.csv')
```


```python
#Now save our cleaned data into JSON format also
cleaned_DF.to_json('cleaned_airport.json')
```

## Now Dump the cleaned_DataFrame to Oracle Database

#### Database Connection


```python
# importing module
import cx_Oracle
```


```python
#KPI-UMAKANTYADA 1521
con = cx_Oracle.connect('air/airport@KPI-UMAKANTYADA:1521/xe')
```


```python
#print connection version
print(con.version)
```

    11.2.0.2.0
    


```python
# Now execute the sqlquery
cursor = con.cursor()
```

#### Creating Table in Database


```python
#DDL command for creating  airport table
sql='''create table airport(code varchar(10),lat number(20,5),lon number(20,5),name varchar(50),city varchar(50),
               state varchar(50),country varchar(50),woeid number(10),tz varchar(50),phone varchar(50),type varchar(20),
               email varchar(50),url varchar(100),runway_length number(20,5),elev number(20,5),icao varchar(50),direct_flights number(30),
               carriers number(30)
              )'''
```


```python
 # Creating a table airport
cursor.execute(sql)
con.commit()
```


```python
#Storing flight_weather csv into Pandas DataFrame
data=open("C:\\Users\\UmakantYadav\\Desktop\\KPI-Partners\\Assignment\\airport_assignment\\Flights_Aircraft_Weather.csv")
df_fw=pd.read_csv(data)
df_fw.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>MONTH</th>
      <th>DAYOFMONTH</th>
      <th>DAYOFWEEK</th>
      <th>ORIGIN</th>
      <th>SCHEDULEDDEPTTIME</th>
      <th>DEST</th>
      <th>SCHEDULEDARRTIME</th>
      <th>FLIGHTNUM</th>
      <th>AIRCRAFTCODE</th>
      <th>UNIQUECARRIER</th>
      <th>ORIGINSKYCOND</th>
      <th>ORIGINVISIBILITY</th>
      <th>ORIGINWINDSPEED</th>
      <th>ORIGINPRESSURE</th>
      <th>DESTSKYCOND</th>
      <th>DESTVISIBILITY</th>
      <th>DESTWINDSPEED</th>
      <th>DESTPRESSURE</th>
      <th>ARRDELAY</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
      <td>3</td>
      <td>4</td>
      <td>IAD</td>
      <td>1955</td>
      <td>TPA</td>
      <td>2225</td>
      <td>335</td>
      <td>B77W</td>
      <td>WN</td>
      <td>FEW</td>
      <td>10.0</td>
      <td>3</td>
      <td>30.34</td>
      <td>CLR</td>
      <td>10.0</td>
      <td>10</td>
      <td>30.63</td>
      <td>-14</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>1</td>
      <td>3</td>
      <td>4</td>
      <td>IAD</td>
      <td>735</td>
      <td>TPA</td>
      <td>1000</td>
      <td>3231</td>
      <td>B788</td>
      <td>WN</td>
      <td>CLR</td>
      <td>10.0</td>
      <td>3</td>
      <td>30.28</td>
      <td>CLR</td>
      <td>10.0</td>
      <td>14</td>
      <td>30.65</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>1</td>
      <td>3</td>
      <td>4</td>
      <td>IND</td>
      <td>620</td>
      <td>BWI</td>
      <td>750</td>
      <td>448</td>
      <td>CRJ2</td>
      <td>WN</td>
      <td>CLR</td>
      <td>10.0</td>
      <td>6</td>
      <td>29.87</td>
      <td>FEW</td>
      <td>10.0</td>
      <td>8</td>
      <td>30.44</td>
      <td>14</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>1</td>
      <td>3</td>
      <td>4</td>
      <td>IND</td>
      <td>1915</td>
      <td>JAX</td>
      <td>2110</td>
      <td>378</td>
      <td>B789</td>
      <td>WN</td>
      <td>FEW</td>
      <td>10.0</td>
      <td>10</td>
      <td>29.70</td>
      <td>CLR</td>
      <td>10.0</td>
      <td>6</td>
      <td>30.69</td>
      <td>11</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>1</td>
      <td>3</td>
      <td>4</td>
      <td>IND</td>
      <td>1830</td>
      <td>LAS</td>
      <td>1940</td>
      <td>509</td>
      <td>B738</td>
      <td>WN</td>
      <td>FEW</td>
      <td>10.0</td>
      <td>10</td>
      <td>29.70</td>
      <td>BKN</td>
      <td>10.0</td>
      <td>3</td>
      <td>27.74</td>
      <td>57</td>
    </tr>
  </tbody>
</table>
</div>




```python
df_fw.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 959297 entries, 0 to 959296
    Data columns (total 20 columns):
     #   Column             Non-Null Count   Dtype  
    ---  ------             --------------   -----  
     0   ID                 959297 non-null  int64  
     1   MONTH              959297 non-null  int64  
     2   DAYOFMONTH         959297 non-null  int64  
     3   DAYOFWEEK          959297 non-null  int64  
     4   ORIGIN             959297 non-null  object 
     5   SCHEDULEDDEPTTIME  959297 non-null  int64  
     6   DEST               959297 non-null  object 
     7   SCHEDULEDARRTIME   959297 non-null  int64  
     8   FLIGHTNUM          959297 non-null  int64  
     9   AIRCRAFTCODE       959297 non-null  object 
     10  UNIQUECARRIER      959297 non-null  object 
     11  ORIGINSKYCOND      959297 non-null  object 
     12  ORIGINVISIBILITY   959297 non-null  float64
     13  ORIGINWINDSPEED    959297 non-null  int64  
     14  ORIGINPRESSURE     959244 non-null  float64
     15  DESTSKYCOND        959297 non-null  object 
     16  DESTVISIBILITY     959297 non-null  float64
     17  DESTWINDSPEED      959297 non-null  int64  
     18  DESTPRESSURE       959261 non-null  float64
     19  ARRDELAY           959297 non-null  int64  
    dtypes: float64(4), int64(10), object(6)
    memory usage: 146.4+ MB
    


```python
df_fw.shape
```




    (959297, 20)




```python
#DDL command for creating 'flight_weather' table
sql='''CREATE TABLE flight_weather(ID NUMBER(10),MONTH NUMBER(10),DAYOFMONTH NUMBER(10),DAYOFWEEK NUMBER(10),ORIGIN VARCHAR(10),
SCHEDULEDDEPTTIME NUMBER(10),DEST VARCHAR(10),SCHEDULEDARRTIME NUMBER(10),FLIGHTNUM VARCHAR(10),AIRCRAFTCODE VARCHAR(10),UNIQUECARRIER VARCHAR(10),ORIGINSKYCOND VARCHAR(10),ORIGINVISIBILITY NUMBER(10,5),
ORIGINWINDSPEED NUMBER(10),ORIGINPRESSURE  NUMBER(10,5),DESTSKYCOND VARCHAR(10),DESTVISIBILITY NUMBER(10,5),DESTWINDSPEED NUMBER(10),
DESTPRESSURE NUMBER(10,5),ARRDELAY NUMBER(10),
PRIMARY KEY(AIRCRAFTCODE)
)
'''
```


```python
# Creating a'flight_weather' table
cursor.execute(sql)
con.commit()
```


```python
#Droping primary key from flight_weather table
query="ALTER TABLE flight_weather DROP PRIMARY KEY"
cursor.execute(query)
con.commit()
```

### Inserting Data into Table


```python
#inserting data into 'airport' table   from DF
for row in cleaned_DF.itertuples():
    cursor.execute("INSERT INTO air.airport VALUES(:CODE,:LAT,:LON,:NAME,:CITY,:STATE,:COUNTRY,:WOEID,:TZ,:PHONE,:TYPE,:EMAIL,:URL,:RUNWAY_LENGTH,:ELEV,:ICAO,:DIRECT_FLIGHTS,:CARRIERS)",(row.code,row.lat,row.lon,row.name,row.city,row.state,row.country,row.woeid,row.tz,row.phone,row.type,row.email,row.url,row.runway_length,row.elev,row.icao,row.direct_flights,row.carriers))
    con.commit()
```


```python
#lets save our cleaned DataFrame into cleaned_DF variable
cleaned_flight=clean_df(df_fw)
```


```python
cleaned_flight.shape
```




    (959297, 20)




```python
#inserting data into 'flight_weather' table from DF
for row in cleaned_flight.itertuples():
    cursor.execute("INSERT INTO air.flight_weather VALUES(:ID,:MONTH,:DAYOFMONTH,:DAYOFWEEK,:ORIGIN,:SCHEDULEDDEPTTIME,:DEST,:SCHEDULEDARRTIME,:FLIGHTNUM,:AIRCRAFTCODE,:UNIQUECARRIER,:ORIGINSKYCOND,:ORIGINVISIBILITY,:ORIGINWINDSPEED,:ORIGINPRESSURE,:DESTSKYCOND,:DESTVISIBILITY,:DESTWINDSPEED,:DESTPRESSURE,:ARRDELAY)",(row.ID,row.MONTH,row.DAYOFMONTH,row.DAYOFWEEK,row.ORIGIN,row.SCHEDULEDDEPTTIME,row.DEST,row.SCHEDULEDARRTIME,row.FLIGHTNUM,row.AIRCRAFTCODE,row.UNIQUECARRIER,row.ORIGINSKYCOND,row.ORIGINVISIBILITY,row.ORIGINWINDSPEED,row.ORIGINPRESSURE,row.DESTSKYCOND,row.DESTVISIBILITY,row.DESTWINDSPEED,row.DESTPRESSURE,row.ARRDELAY))
    con.commit()

```


```python
#now lets chek the number rows inserted into DB
run=pd.read_sql("SELECT COUNT(*) FROM flight_weather",con)
run
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>COUNT(*)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>959297</td>
    </tr>
  </tbody>
</table>
</div>



#### Wohh!! We loaded the data correctly in our Oracle Database

### Now,Lets set the foreign key between two table


```python
#set primary key for 'airport' table
cursor.execute("ALTER TABLE airport ADD CONSTRAINT pk_airport PRIMARY KEY(CODE)")
con.commit()
```


```python
#set foreign key(ORIGIN) for 'flight_weather' table
cursor.execute("ALTER TABLE flight_weather ADD CONSTRAINT fk_flight_weather FOREIGN KEY (ORIGIN) REFERENCES airport (CODE)")
con.commit()
```


```python
#set foreign key(DEST) for 'flight_weather' table
cursor.execute("ALTER TABLE flight_weather ADD CONSTRAINT fk_flight_weather_d FOREIGN KEY (DEST) REFERENCES airport (CODE)")
con.commit()
```

Note:We have sucessfully set foreign key between airport and flight_weather table.

### Fetching the Data From Oracle DB

#### Query1:Find the most frequent flight path (orign and desitnation combination)


```python
#Find the most frequent flight path (orign and desitnation combination)
query='''select max(origin) AS "Frequent flight path" from flight_weather
where origin=(select max(dest) from flight_weather)'''
pd.read_sql(query,con)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Frequent flight path</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>TYS</td>
    </tr>
  </tbody>
</table>
</div>



#### 2:Find Top 5 destinations airports with most delays


```python
#Find Top 5 destinations airports with most delays
query='''SELECT * FROM (
select DEST,MAX(ARRDELAY)  
from flight_weather
GROUP BY DEST
ORDER BY MAX(ARRDELAY) DESC)
WHERE ROWNUM<=5'''
pd.read_sql(query,con)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>DEST</th>
      <th>MAX(ARRDELAY)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>ROC</td>
      <td>80</td>
    </tr>
    <tr>
      <th>1</th>
      <td>RNO</td>
      <td>80</td>
    </tr>
    <tr>
      <th>2</th>
      <td>ISP</td>
      <td>80</td>
    </tr>
    <tr>
      <th>3</th>
      <td>ELP</td>
      <td>80</td>
    </tr>
    <tr>
      <th>4</th>
      <td>MCO</td>
      <td>80</td>
    </tr>
  </tbody>
</table>
</div>



#### 3:Find the Origin and Destination path with most delays


```python
#3.Find the Origin and Destination path with most delays
query='''SELECT ORIGIN,DEST,MAX(ARRDELAY) AS "DELAY"
FROM flight_weather
GROUP BY ORIGIN,DEST
HAVING MAX(ARRDELAY)=(SELECT MAX(arrdelay)
from flight_weather)
'''
pd.read_sql(query,con)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ORIGIN</th>
      <th>DEST</th>
      <th>DELAY</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>MCO</td>
      <td>IND</td>
      <td>80</td>
    </tr>
    <tr>
      <th>1</th>
      <td>PHL</td>
      <td>PIT</td>
      <td>80</td>
    </tr>
    <tr>
      <th>2</th>
      <td>ELP</td>
      <td>LAS</td>
      <td>80</td>
    </tr>
    <tr>
      <th>3</th>
      <td>GEG</td>
      <td>SLC</td>
      <td>80</td>
    </tr>
    <tr>
      <th>4</th>
      <td>MCO</td>
      <td>RDU</td>
      <td>80</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>509</th>
      <td>PHL</td>
      <td>MIA</td>
      <td>80</td>
    </tr>
    <tr>
      <th>510</th>
      <td>DFW</td>
      <td>JAX</td>
      <td>80</td>
    </tr>
    <tr>
      <th>511</th>
      <td>LGA</td>
      <td>MIA</td>
      <td>80</td>
    </tr>
    <tr>
      <th>512</th>
      <td>MCO</td>
      <td>PWM</td>
      <td>80</td>
    </tr>
    <tr>
      <th>513</th>
      <td>TPA</td>
      <td>ORF</td>
      <td>80</td>
    </tr>
  </tbody>
</table>
<p>514 rows × 3 columns</p>
</div>



#### 4:Find the Avg delay by country and carrier


```python
#Find the Avg delay by country and carrier
query='select ROUND(avg(arrdelay),3) AS "Avg_Delay" from flight_weather where origin in (select code from airport group by country, carriers, code)'
pd.read_sql(query,con)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Avg_Delay</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2.579</td>
    </tr>
  </tbody>
</table>
</div>




```python

```
