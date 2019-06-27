-- Joining data on Christmas from the beginning of CitiBike data to show relative temps and daily trips
SELECT 
  d_date.date_actual, 
  weather.max_temp, 
  weather.min_temp, 
  citibike.daily_trips 
FROM 
  weather 
  INNER JOIN citibike on weather.dateint = citibike.dateint 
  INNER JOIN d_date on weather.dateint = cast(d_date.mmddyyyy AS int) 
WHERE 
  weather.dateint = 12252014 
  OR weather.dateint = 12252013 
  OR weather.dateint = 12252015 
  OR weather.dateint = 12252016 
  OR weather.dateint = 12252017;





--Grouped on weekday showing the most popluar day to ride on average
SELECT 
  d_date.day_name, 
  round(avg(weather.max_temp),2) as Max_Temp, 
  round(avg(weather.min_temp),2) as Min_Temp, 
  round(avg(citibike.daily_trips),2)as Daily_Trips 
FROM 
  weather 
  INNER JOIN citibike on weather.dateint = citibike.dateint 
  INNER JOIN d_date on weather.dateint = cast(d_date.mmddyyyy AS int) 
GROUP BY 
  d_date.day_name;




--Grouped on monthto show most popluar motnh to ride citibikes with relative avg tempatures 

SELECT 
  d_date.month_name, 
  round(avg(weather.max_temp),2) as Max_Temp, 
  round(avg(weather.min_temp),2) as Min_Temp,  
  round(avg(citibike.daily_trips),2)as Daily_Trips 
FROM 
  weather 
  INNER JOIN citibike on weather.dateint = citibike.dateint 
  INNER JOIN d_date on weather.dateint = cast(d_date.mmddyyyy AS int) 
GROUP BY 
  d_date.month_name 
ORDER BY 
  Daily_Trips DESC;
  
  
  
--Grouped on the most rides taken place on one day
SELECT 
  d_date.date_actual, 
  weather.max_temp, 
  weather.min_temp, 
  citibike.daily_trips 
FROM 
  weather 
  INNER JOIN citibike on weather.dateint = citibike.dateint 
  INNER JOIN d_date on weather.dateint = cast(d_date.mmddyyyy AS int) 
ORDER BY 
  citibike.daily_trips DESC;




-- Grouped on the hottest day over the past 4 years in desc order
SELECT 
  d_date.date_actual, 
  weather.max_temp, 
  weather.min_temp, 
  citibike.daily_trips 
FROM 
  weather 
  INNER JOIN citibike on weather.dateint = citibike.dateint 
  INNER JOIN d_date on weather.dateint = cast(d_date.mmddyyyy AS int) 
ORDER BY 
  weather.max_temp DESC;





-- Grouped on the lowest temp
SELECT 
  d_date.date_actual, 
  weather.max_temp, 
  weather.min_temp, 
  citibike.daily_trips 
FROM 
  weather 
  INNER JOIN citibike on weather.dateint = citibike.dateint 
  INNER JOIN d_date on weather.dateint = cast(d_date.mmddyyyy AS int) 
ORDER BY 
  weather.max_temp ASC;
  
  
--Grouped on the largest snow depth

SELECT d_date.date_actual, 
weather.snow_depth_in_inches, 
citibike.daily_trips 
FROM 
  weather 
  INNER JOIN citibike on weather.dateint = citibike.dateint 
  INNER JOIN d_date on weather.dateint = cast(d_date.mmddyyyy AS int) 
ORDER BY 
  weather.snow_depth_in_inches DESC;
  


--Grouped on the highest amount of rainfall
  
SELECT 
  d_date.date_actual, 
  weather.percip_in_inches, 
  citibike.daily_trips 
FROM 
  weather 
  INNER JOIN citibike on weather.dateint = citibike.dateint 
  INNER JOIN d_date on weather.dateint = cast(d_date.mmddyyyy AS int) 
ORDER BY 
  weather.percip_in_inches DESC;
  

 
  

  
 