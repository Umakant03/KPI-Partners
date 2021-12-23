```python
# importing module
import cx_Oracle
```


```python
#KPI-UMAKANTYADA 1521

con = cx_Oracle.connect('UMA/root1@KPI-UMAKANTYADA:1521/xe')
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


```python
import pandas as pd
```


```python
 # Creating a table employee
cursor.execute("create table employee(empid integer primary key, name varchar2(30), salary number(10, 2))")
con.commit()
```


```python
cursor.execute("INSERT INTO employee(empid,name,salary) \
      VALUES (1, 'Paul',20000.00 )");

cursor.execute("INSERT INTO employee(empid,name,salary) \
      VALUES (2, 'Allen',15000.00 )");

cursor.execute("INSERT INTO employee(empid,name,salary) \
      VALUES (3, 'Teddy',20000.00 )");

cursor.execute("INSERT INTO employee(empid,name,salary) \
      VALUES (4, 'Mark',65000.00 )");

con.commit()
```


```python
df=pd.read_sql('select * from employee',con)
```


```python
df
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
      <th>EMPID</th>
      <th>NAME</th>
      <th>SALARY</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Paul</td>
      <td>20000.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Allen</td>
      <td>15000.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Teddy</td>
      <td>20000.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Mark</td>
      <td>65000.0</td>
    </tr>
  </tbody>
</table>
</div>




```python

```
