Three variables I chose:  
1. external debt (current dollar)  
2. current account balance (current dollar)  
3. nominal GDP growth rate.  

Number of countries in my data table (after cleaning): 219  
Number of years in my data table (after cleanin): 64  

The country with highest external debt in 2000: Brizil  
The country with lowest external debt in 2000: Kosowo  
The country with highest current account balance (biggest trade surplus) in 2000: Japan  
The country with lowest current account balance (biggest trade deficit) in 2000: United States  
The country with highest nominal GDP growth rate in 2000: Timor-Leste  
The country with lowest nominal GDP growth rate in 2000: Solomon Islands  

What did I do to obtain the data:  
1. Data collection and premilinary cleaning. I manually downloaded the data for the three variable on the website of World Bank. The three CSV files come with some descriptive texts on top of data tables, and I deleted them. When I try to import the three CSV files to Stata, Stata created new variable names instead of using the names in the first row of the CSV files, since the names in CSV files are capitalised and contains pure numbers. I lower cased the variable names and added 'year' before all the numbers.  

2. Data cleaning. I reshaped the three data table from wide to long, and then merged them into one workfile. After noticing missing values, I dedeted the rows that miss all three variables I picked. After noticing that some of the entities in the data table are not country but regional aggregates, I created a country flag using information from a CSV file that comes from the three data tables and describes all the entities. By merging the country flag into the workfile, I deleted all non-country entities.  

Difficulties encountered:  
Creating the country flag is a bit challenging. I have to refer to the background information provided by World Bank to create a is_country flag by myself. Besides, there is no existing variable that indicates whether an entitiy in the data tables is a country, so I observed and found that all the non-country entities have their region varibale missing, and used this feature to create the country flag.  

