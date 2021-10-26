#Importing csv data for Bajaj Auto with help of table import wizard
#Viewing bajajAuto table data
create table `bajajauto` ( 
	`Date` text,
	`Open Price` double,
    `High Price` double,
    `Low Price` double,
    `Close Price` double,
    `WAP` double,
    `No.of Shares` int,
    `No.of Trades` int,
    `Total Turnover (Rs.)` bigint,
    `Deliverable Quantity` varchar(50),
    `% Deli. Qty to Traded Qty` varchar(50),
    `Spread High-Low` double,
    `Spread Close-Open` double);

LOAD DATA  infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/BajajAuto.csv'
INTO TABLE `bajajauto` 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

select * from bajajauto;

#Importing csv data for Eicher Motors with help of table import wizard
#Viewing eichermotors table data
create table `eichermotors` ( 
	`Date` text,
	`Open Price` double,
    `High Price` double,
    `Low Price` double,
    `Close Price` double,
    `WAP` double,
    `No.of Shares` int,
    `No.of Trades` int,
    `Total Turnover (Rs.)` bigint,
    `Deliverable Quantity` varchar(50),
    `% Deli. Qty to Traded Qty` varchar(50),
    `Spread High-Low` double,
    `Spread Close-Open` double);

LOAD DATA  infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Eicher Motors.csv'
INTO TABLE `eichermotors` 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

select * from eichermotors;

#Importing csv data for Hero Motocorp with help of table import wizard
#Viewing heromotocorp table data
create table `heromotocorp` ( 
	`Date` text,
	`Open Price` double,
    `High Price` double,
    `Low Price` double,
    `Close Price` double,
    `WAP` double,
    `No.of Shares` int,
    `No.of Trades` int,
    `Total Turnover (Rs.)` bigint,
    `Deliverable Quantity` varchar(50),
    `% Deli. Qty to Traded Qty` varchar(50),
    `Spread High-Low` double,
    `Spread Close-Open` double);

LOAD DATA  infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hero Motocorp.csv'
INTO TABLE `heromotocorp` 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

select * from heromotocorp;

#Importing csv data for Infosys with help of table import wizard
#Viewing infosys table data
create table `infosys` ( 
	`Date` text,
	`Open Price` double,
    `High Price` double,
    `Low Price` double,
    `Close Price` double,
    `WAP` double,
    `No.of Shares` int,
    `No.of Trades` int,
    `Total Turnover (Rs.)` bigint,
    `Deliverable Quantity` varchar(50),
    `% Deli. Qty to Traded Qty` varchar(50),
    `Spread High-Low` double,
    `Spread Close-Open` double);

LOAD DATA  infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Infosys.csv'
INTO TABLE `infosys` 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

select * from infosys;

#Importing csv data for TCS with help of table import wizard
#Viewing tcs table data
create table `tcs` ( 
	`Date` text,
	`Open Price` double,
    `High Price` double,
    `Low Price` double,
    `Close Price` double,
    `WAP` double,
    `No.of Shares` int,
    `No.of Trades` int,
    `Total Turnover (Rs.)` bigint,
    `Deliverable Quantity` varchar(50),
    `% Deli. Qty to Traded Qty` varchar(50),
    `Spread High-Low` double,
    `Spread Close-Open` double);

LOAD DATA  infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/TCS.csv'
INTO TABLE `tcs` 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

select * from tcs;

#Importing csv data for TVS Motors with help of table import wizard
#Viewing tvsmotors table data
create table `tvsmotors` ( 
	`Date` text,
	`Open Price` double,
    `High Price` double,
    `Low Price` double,
    `Close Price` double,
    `WAP` double,
    `No.of Shares` int,
    `No.of Trades` int,
    `Total Turnover (Rs.)` bigint,
    `Deliverable Quantity` varchar(50),
    `% Deli. Qty to Traded Qty` varchar(50),
    `Spread High-Low` double,
    `Spread Close-Open` double);

LOAD DATA  infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/TVS Motors.csv'
INTO TABLE `tvsmotors` 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

select * from tvsmotors;

#Converting date column to appropirate date format for all 6 stocks.
update bajajauto
set `Date` = STR_TO_DATE(`Date`, '%e-%M-%Y');

update eichermotors
set `Date` = STR_TO_DATE(`Date`, '%e-%M-%Y');

update heromotocorp
set `Date` = STR_TO_DATE(`Date`, '%e-%M-%Y');

update tcs
set `Date` = STR_TO_DATE(`Date`, '%e-%M-%Y');

update infosys
set `Date` = STR_TO_DATE(`Date`, '%e-%M-%Y');

update tvsmotors
set `Date` = STR_TO_DATE(`Date`, '%e-%M-%Y');

#2. Creating new table bajaj1 for Baja Auto stock with 20day and 50day moving average
create table `bajaj1` as

SELECT `Date`,`Close Price`,

CASE WHEN ROW_NUMBER() OVER (ORDER BY `Date` ) > 19

THEN round(AVG(`Close Price`) OVER (ORDER BY `Date`  ROWS BETWEEN 19 PRECEDING AND CURRENT ROW),2)  END AS '20 DAY MA',

CASE WHEN ROW_NUMBER() OVER (ORDER BY `Date` ) > 49

THEN round(AVG(`Close Price`) OVER (ORDER BY `Date`  ROWS BETWEEN 49 PRECEDING AND CURRENT ROW),2)  END AS '50 DAY MA'

from bajajauto;

select * from bajaj1;


#Creating new table eichermotors1 for Eicher Motors stock with 20day and 50day moving average
create table `eichermotors1` as

SELECT `Date`,`Close Price`,

CASE WHEN ROW_NUMBER() OVER (ORDER BY `Date` ) > 19

THEN round(AVG(`Close Price`) OVER (ORDER BY `Date`  ROWS BETWEEN 19 PRECEDING AND CURRENT ROW),2)  END AS '20 DAY MA',

CASE WHEN ROW_NUMBER() OVER (ORDER BY `Date` ) > 49

THEN round(AVG(`Close Price`) OVER (ORDER BY `Date`  ROWS BETWEEN 49 PRECEDING AND CURRENT ROW),2)  END AS '50 DAY MA'

from eichermotors;

select * from eichermotors1;


#Creating new table heromotocorp1 for Hero Motors Corp stock with 20day and 50day moving average
create table `heromotocorp1` as

SELECT `Date`,`Close Price`,

CASE WHEN ROW_NUMBER() OVER (ORDER BY `Date` ) > 19

THEN round(AVG(`Close Price`) OVER (ORDER BY `Date`  ROWS BETWEEN 19 PRECEDING AND CURRENT ROW),2)  END AS '20 DAY MA',

CASE WHEN ROW_NUMBER() OVER (ORDER BY `Date` ) > 49

THEN round(AVG(`Close Price`) OVER (ORDER BY `Date`  ROWS BETWEEN 49 PRECEDING AND CURRENT ROW),2)  END AS '50 DAY MA'

from heromotocorp;

select * from heromotocorp1;


#Creating new table infosys1 for Infosys stock with 20day and 50day moving average
create table `infosys1` as

SELECT `Date`,`Close Price`,

CASE WHEN ROW_NUMBER() OVER (ORDER BY `Date` ) > 19

THEN round(AVG(`Close Price`) OVER (ORDER BY `Date`  ROWS BETWEEN 19 PRECEDING AND CURRENT ROW),2)  END AS '20 DAY MA',

CASE WHEN ROW_NUMBER() OVER (ORDER BY `Date` ) > 49

THEN round(AVG(`Close Price`) OVER (ORDER BY `Date`  ROWS BETWEEN 49 PRECEDING AND CURRENT ROW),2)  END AS '50 DAY MA'

from infosys;

select * from infosys1;

#Creating new table tcs1 for TCS stock with 20day and 50day moving average
create table `tcs1` as

SELECT `Date`,`Close Price`,

CASE WHEN ROW_NUMBER() OVER (ORDER BY `Date` ) > 19

THEN round(AVG(`Close Price`) OVER (ORDER BY `Date`  ROWS BETWEEN 19 PRECEDING AND CURRENT ROW),2)  END AS '20 DAY MA',

CASE WHEN ROW_NUMBER() OVER (ORDER BY `Date` ) > 49

THEN round(AVG(`Close Price`) OVER (ORDER BY `Date`  ROWS BETWEEN 49 PRECEDING AND CURRENT ROW),2)  END AS '50 DAY MA'

from tcs;

select * from tcs1;


#Creating new table tvsmotors1 for TVS Motors stock with 20day and 50day moving average
create table `tvsmotors1` as

SELECT `Date`,`Close Price`,

CASE WHEN ROW_NUMBER() OVER (ORDER BY `Date` ) > 19

THEN round(AVG(`Close Price`) OVER (ORDER BY `Date`  ROWS BETWEEN 19 PRECEDING AND CURRENT ROW),2)  END AS '20 DAY MA',

CASE WHEN ROW_NUMBER() OVER (ORDER BY `Date` ) > 49

THEN round(AVG(`Close Price`) OVER (ORDER BY `Date`  ROWS BETWEEN 49 PRECEDING AND CURRENT ROW),2)  END AS '50 DAY MA'

from tvsmotors;

select * from tvsmotors1;


# 2. Creating master table with Date and close price of all stocks.
create table stock_mastertable as
select bajaj1.`Date` , bajaj1.`Close Price` as 'Bajaj' , tcs1.`Close Price` as 'TCS' , tvsmotors1.`Close Price` as 'TVS',
infosys1.`Close Price` as 'Infosys' , eichermotors1.`Close Price` as 'Eicher',heromotocorp1.`Close Price` as 'Hero' from bajaj1 
 join tcs1 on bajaj1.`Date` = tcs1.`Date`
 join tvsmotors1 on tcs1.`Date`= tvsmotors1.`Date` 
 join infosys1 on tvsmotors1.`Date` = infosys1.`Date`
 join eichermotors1 on infosys1.`Date` = eichermotors1.`Date`
 join heromotocorp1 on eichermotors1.`Date` = heromotocorp1.`Date`;

select * from stock_mastertable;

# 3.Create Buy/Sell signal table for all stocks using windows LAG function to comare current and previous rows averages.

# Bajaj Auto Buy/Sell signal table
create table bajaj2 as
select `Date`,`Close Price`, 
Case
	when (LAG(`20 Day MA`,0) over w > LAG(`50 Day MA`,0) over w) and (LAG(`20 Day MA`,1,0) over w < LAG(`50 Day MA`,1,0) over w) then 'BUY'
    when (LAG(`20 Day MA`,0) over w < LAG(`50 Day MA`,0) over w) and (LAG(`20 Day MA`,1,0) over w > LAG(`50 Day MA`,1,0) over w) then 'SELL'
    else 'HOLD'
end as 'Signal'
from bajaj1
WINDOW w AS (order by `Date`);


# Eicher Motors Buy/Sell signal table
create table eichermotors2 as
select `Date`,`Close Price`, 
Case
	when (LAG(`20 Day MA`,0) over w > LAG(`50 Day MA`,0) over w) and (LAG(`20 Day MA`,1,0) over w < LAG(`50 Day MA`,1,0) over w) then 'BUY'
    when (LAG(`20 Day MA`,0) over w < LAG(`50 Day MA`,0) over w) and (LAG(`20 Day MA`,1,0) over w > LAG(`50 Day MA`,1,0) over w) then 'SELL'
    else 'HOLD'
end as 'Signal'
from eichermotors1
WINDOW w AS (order by `Date`);

# Hero Moto Corp Buy/Sell signal table
create table heromotocorp2 as
select `Date`,`Close Price`, 
Case
	when (LAG(`20 Day MA`,0) over w > LAG(`50 Day MA`,0) over w) and (LAG(`20 Day MA`,1,0) over w < LAG(`50 Day MA`,1,0) over w) then 'BUY'
    when (LAG(`20 Day MA`,0) over w < LAG(`50 Day MA`,0) over w) and (LAG(`20 Day MA`,1,0) over w > LAG(`50 Day MA`,1,0) over w) then 'SELL'
    else 'HOLD'
end as 'Signal'
from heromotocorp1
WINDOW w AS (order by `Date`);

# Infosys Buy/Sell signal table
create table infosys2 as
select `Date`,`Close Price`, 
Case
	when (LAG(`20 Day MA`,0) over w > LAG(`50 Day MA`,0) over w) and (LAG(`20 Day MA`,1,0) over w < LAG(`50 Day MA`,1,0) over w) then 'BUY'
    when (LAG(`20 Day MA`,0) over w < LAG(`50 Day MA`,0) over w) and (LAG(`20 Day MA`,1,0) over w > LAG(`50 Day MA`,1,0) over w) then 'SELL'
    else 'HOLD'
end as 'Signal'
from infosys1
WINDOW w AS (order by `Date`);

# TCS Buy/Sell signal table
create table tcs2 as
select `Date`,`Close Price`, 
Case
	when (LAG(`20 Day MA`,0) over w > LAG(`50 Day MA`,0) over w) and (LAG(`20 Day MA`,1,0) over w < LAG(`50 Day MA`,1,0) over w) then 'BUY'
    when (LAG(`20 Day MA`,0) over w < LAG(`50 Day MA`,0) over w) and (LAG(`20 Day MA`,1,0) over w > LAG(`50 Day MA`,1,0) over w) then 'SELL'
    else 'HOLD'
end as 'Signal'
from tcs1
WINDOW w AS (order by `Date`);

# TVS Motors Buy/Sell signal table
create table tvsmotors2 as
select `Date`,`Close Price`, 
Case
	when (LAG(`20 Day MA`,0) over w > LAG(`50 Day MA`,0) over w) and (LAG(`20 Day MA`,1,0) over w < LAG(`50 Day MA`,1,0) over w) then 'BUY'
    when (LAG(`20 Day MA`,0) over w < LAG(`50 Day MA`,0) over w) and (LAG(`20 Day MA`,1,0) over w > LAG(`50 Day MA`,1,0) over w) then 'SELL'
    else 'HOLD'
end as 'Signal'
from tvsmotors1
WINDOW w AS (order by `Date`);

#4.User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) for the Bajaj stock.
#Assuming input date will be provided in same format as in bajaj2 table YYYY-MM-DD.
DELIMITER $$
create function detectSignal (input_date char(50))
returns char(20) deterministic
begin
declare res_signal char(20);
	select `signal` into res_signal from bajaj2 where `date` = input_date;
return res_signal;
end; $$
DELIMITER ;

#Calling detectSignal function to get signal for '2015-05-18' for Bajaj Auto stock
select detectSignal('2015-05-18');

select count(*) from bajaj2 where `signal` = 'BUY';
select count(*) from bajaj2 where `signal` = 'SELL';

select count(*) from eichermotors2 where `signal` = 'BUY';
select count(*) from eichermotors2 where `signal` = 'SELL';

select count(*) from heromotocorp2 where `signal` = 'BUY';
select count(*) from heromotocorp2 where `signal` = 'SELL';

select count(*) from infosys2 where `signal` = 'BUY';
select count(*) from infosys2 where `signal` = 'SELL';

select count(*) from tcs2 where `signal` = 'BUY';
select count(*) from tcs2 where `signal` = 'SELL';

select count(*) from tvsmotors2 where `signal` = 'BUY';
select count(*) from tvsmotors2 where `signal` = 'SELL';