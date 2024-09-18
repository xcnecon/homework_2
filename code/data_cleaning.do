// set directories
global root "/Users/chenning/Documents/GitHub/homework_2"
global data "$root/data"
global raw "$data/raw_data"
global tidy "$data/tidy_data"

// import data of external debt, using first row as col names
clear
import delimited "$raw/external_debt.csv",varnames(1)
// reshape the data table from wide to long
reshape long year, i(country) j(time)
// rename columns
rename year external_debt
rename time year
// drop unwanted columns
drop indicator indicator_code country_code
// save
cd "$data/tidy_data"
save external_debt, replace

// import data of current account balance
clear
import delimited "$raw/current_account_balance.csv",varnames(1)
// reshape the data table from wide to long
reshape long year, i(country) j(time)
// rename columns
rename year current_account_balance
rename time year
// drop unwanted columns
drop indicator indicator_code country_code
// save
cd "$data/tidy_data"
save current_account_balance, replace

// import data of nominal gdp growth
clear
import delimited "$raw/nominal_gdp_growth.csv",varnames(1)
// reshape the data table from wide to long
reshape long year, i(country) j(time)
// rename columns
rename year nominal_gdp_growth
rename time year
// drop unwanted columns
drop indicator indicator_code country_code
// save
cd "$data/tidy_data"
save nominal_gdp_growth, replace

// merge three table into one table
use "external_debt.dta", clear
merge 1:1 country year using "current_account_balance.dta"
drop _merge
merge 1:1 country year using "nominal_gdp_growth"
drop _merge

// drop rows if all three data are missing, which makes the obs meaningless
drop if missing(external_debt) & missing(current_account_balance) & missing(nominal_gdp_growth)
save workfile, replace

