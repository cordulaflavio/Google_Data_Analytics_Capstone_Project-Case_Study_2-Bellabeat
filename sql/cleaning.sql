-- Tables to be cleaned and used on the next phases are:
/*
	dailyactivity_merged
	heartrate_seconds_merged
	hourlycalories_merged
	hourlyintensities_merged
	hourlysteps_merged
	sleepday_merged
	weightloginfo_merged
 */	
 
-- needs no cleaning
SELECT * FROM case_study.dailyactivity_merged dm


-- need cleaning / split date and time and add day of week 
SELECT * FROM case_study.heartrate_seconds_merged hsm

---------------- Cleaning heartrate_seconds_merged

ALTER TABLE case_study.heartrate_seconds_merged 
ADD COLUMN heartrate_date date,
ADD COLUMN heartrate_day_name varchar (15),
ADD COLUMN heartrate_time varchar(8); 

UPDATE case_study.heartrate_seconds_merged hsm 
SET heartrate_date = to_date(hsm."Time",'mm/dd/yyyy')
WHERE hsm."Time" IS NOT NULL;

UPDATE case_study.heartrate_seconds_merged hsm 
SET heartrate_day_name = to_char(heartrate_date, 'day')
WHERE hsm.heartrate_date IS NOT NULL;

UPDATE case_study.heartrate_seconds_merged hsm 
SET heartrate_time = to_char(to_timestamp(hsm."Time",'mm/dd/yyyy hh12:mi:ss AM,PM'),'hh24:mi:ss')
WHERE hsm."Time" IS NOT NULL;

SELECT * FROM case_study.heartrate_seconds_merged hsm -- OK 

---------------- END cleaning heartrate_seconds_merged


-- need cleaning / split date and time and add day of week
SELECT * FROM case_study.hourlycalories_merged hm

----------------  Cleaning hourlycalories_merged

ALTER TABLE case_study.hourlycalories_merged 
ADD COLUMN activity_date date,
ADD COLUMN activity_day_name varchar (15),
ADD COLUMN activity_hour varchar(8);

UPDATE case_study.hourlycalories_merged hm 
SET activity_date = to_date(hm.activityhour,'mm/dd/yyyy')
WHERE hm.activityhour IS NOT NULL;

UPDATE case_study.hourlycalories_merged hm
SET activity_day_name = to_char(activity_date, 'day')
WHERE hm.activity_date IS NOT NULL;

UPDATE case_study.hourlycalories_merged hm 
SET activity_hour = to_char(to_timestamp(hm.activityhour,'mm/dd/yyyy hh12:mi:ss AM,PM'),'hh24:mi:ss')
WHERE hm.activityhour IS NOT NULL;

SELECT * FROM case_study.hourlycalories_merged hm  -- OK 

----------------  END cleaning hourlycalories_merged


-- need cleaning / split date and time and add day of week
SELECT * FROM case_study.hourlyintensities_merged hm

----------------  Cleaning hourlyintensities_merged

ALTER TABLE case_study.hourlyintensities_merged 
ADD COLUMN activity_date date,
ADD COLUMN activity_day_name varchar (15),
ADD COLUMN activity_hour varchar(8);

UPDATE case_study.hourlyintensities_merged hm 
SET activity_date = to_date(hm.activityhour,'mm/dd/yyyy')
WHERE hm.activityhour IS NOT NULL;

UPDATE case_study.hourlyintensities_merged hm
SET activity_day_name = to_char(activity_date, 'day')
WHERE hm.activity_date IS NOT NULL;

UPDATE case_study.hourlyintensities_merged hm 
SET activity_hour = to_char(to_timestamp(hm.activityhour,'mm/dd/yyyy hh12:mi:ss AM,PM'),'hh24:mi:ss')
WHERE hm.activityhour IS NOT NULL;

SELECT * FROM case_study.hourlyintensities_merged hm -- OK 

----------------  END cleaning hourlyintensities_merged


-- need cleaning / split date and time and add day of week
SELECT * FROM case_study.hourlysteps_merged hm

----------------  Cleaning hourlysteps_merged

ALTER TABLE case_study.hourlysteps_merged 
ADD COLUMN activity_date date,
ADD COLUMN activity_day_name varchar (15),
ADD COLUMN activity_hour varchar(8);

UPDATE case_study.hourlysteps_merged hm 
SET activity_date = to_date(hm.activityhour,'mm/dd/yyyy')
WHERE hm.activityhour IS NOT NULL;

UPDATE case_study.hourlysteps_merged hm
SET activity_day_name = to_char(activity_date, 'day')
WHERE hm.activity_date IS NOT NULL;

UPDATE case_study.hourlysteps_merged hm 
SET activity_hour = to_char(to_timestamp(hm.activityhour,'mm/dd/yyyy hh12:mi:ss AM,PM'),'hh24:mi:ss')
WHERE hm.activityhour IS NOT NULL;

SELECT * FROM case_study.hourlysteps_merged hm -- OK

----------------  END cleaning hourlysteps_merged


-- need cleaning / split date and time and add day of week
SELECT * FROM case_study.sleepday_merged sm

----------------  Cleaning sleepday_merged

ALTER TABLE case_study.sleepday_merged 
ADD COLUMN sleep_date date,
ADD COLUMN sleep_day_name varchar (15),
ADD COLUMN sleep_hour varchar(8);

UPDATE case_study.sleepday_merged sm 
SET sleep_date = to_date(sm.sleepday,'mm/dd/yyyy')
WHERE sm.sleepday IS NOT NULL;

UPDATE case_study.sleepday_merged sm
SET sleep_day_name = to_char(sm.sleep_date, 'day')
WHERE sm.sleep_date IS NOT NULL;

UPDATE case_study.sleepday_merged sm 
SET sleep_hour = to_char(to_timestamp(sm.sleepday,'mm/dd/yyyy hh12:mi:ss AM,PM'),'hh24:mi:ss')
WHERE sm.sleepday IS NOT NULL;

SELECT * FROM case_study.sleepday_merged sm -- OK

----------------  END cleaning hourlysteps_merged


-- need cleaning / split date and time and add day of week
SELECT * FROM case_study.weightloginfo_merged wm 

----------------  Cleaning weightloginfo_merged

ALTER TABLE case_study.weightloginfo_merged 
ADD COLUMN weightlog_date date,
ADD COLUMN weightlog_day_name varchar (15),
ADD COLUMN weightlog_hour varchar(8);

UPDATE case_study.weightloginfo_merged wm 
SET weightlog_date = to_date(wm."Date",'mm/dd/yyyy')
WHERE wm."Date" IS NOT NULL;

UPDATE case_study.weightloginfo_merged wm
SET weightlog_day_name = to_char(wm.weightlog_date, 'day')
WHERE wm.weightlog_date IS NOT NULL;

UPDATE case_study.weightloginfo_merged wm
SET weightlog_hour = to_char(to_timestamp(wm."Date",'mm/dd/yyyy hh12:mi:ss AM,PM'),'hh24:mi:ss')
WHERE wm."Date" IS NOT NULL;

SELECT * FROM case_study.weightloginfo_merged wm -- OK

----------------  END cleaning weightloginfo_merged


---------------- Trim to remove spaces on day_name columns 

UPDATE 	case_study.heartrate_seconds_merged
SET 	heartrate_day_name = trim(heartrate_day_name)
WHERE 	heartrate_day_name IS NOT NULL;

UPDATE 	case_study.hourlycalories_merged 
SET 	activity_day_name = trim(activity_day_name)
WHERE 	activity_day_name IS NOT NULL;

UPDATE 	case_study.hourlyintensities_merged  
SET 	activity_day_name = trim(activity_day_name)
WHERE 	activity_day_name IS NOT NULL;

UPDATE 	case_study.hourlysteps_merged  
SET 	activity_day_name = trim(activity_day_name)
WHERE 	activity_day_name IS NOT NULL;

UPDATE 	case_study.sleepday_merged  
SET 	sleep_day_name = trim(sleep_day_name)
WHERE 	sleep_day_name IS NOT NULL;

UPDATE 	case_study.weightloginfo_merged 
SET 	weightlog_day_name = trim(weightlog_day_name)
WHERE 	weightlog_day_name IS NOT NULL;

---------------- END TRIM


-- hourly tables seems to have the same ids and activity_date 
SELECT	hm.id, hm.activityhour, hm2.activityhour, hm3.activityhour 
FROM 	case_study.hourlycalories_merged hm 
		INNER JOIN case_study.hourlyintensities_merged hm2 ON (hm2.id = hm.id AND hm2.activityhour = hm.activityhour)
		INNER JOIN case_study.hourlysteps_merged hm3 ON (hm3.id = hm.id AND hm3.activityhour = hm.activityhour)
ORDER BY hm.id, hm.activityhour 

-- Create table case_study.hourlyactivity_merged
-- joining this three tables into one

CREATE TABLE case_study.hourlyactivity_merged AS ( 
SELECT	hm.id, hm.activity_date, hm.activity_day_name, hm.activity_hour, hm.calories, hm2.totalintensity, hm2.averageintensity, hm3.steptotal  
FROM 	case_study.hourlycalories_merged hm 
		INNER JOIN case_study.hourlyintensities_merged hm2 ON (hm2.id = hm.id AND hm2.activityhour = hm.activityhour)
		INNER JOIN case_study.hourlysteps_merged hm3 ON (hm3.id = hm.id AND hm3.activityhour = hm.activityhour)
ORDER BY hm.id, hm.activity_date, hm.activity_hour);  

-- validating this new table

-- 56287 (same)
SELECT 	sum(hm.calories)
FROM 	case_study.hourlycalories_merged hm 
WHERE 	hm.id = 1503960366

-- 56287 (same)
SELECT 	sum(hm.calories)
FROM 	case_study.hourlyactivity_merged hm 
WHERE 	hm.id = 1503960366

-- 7766 (same)
SELECT 	sum(hm.calories)
FROM 	case_study.hourlycalories_merged hm 
WHERE 	hm.id = 1503960366
		AND hm.activity_day_name ILIKE 'monday'
		
-- 7766 (same)
SELECT 	sum(hm.calories)
FROM 	case_study.hourlyactivity_merged hm 
WHERE 	hm.id = 1503960366
		AND hm.activity_day_name ILIKE 'monday'

-- 15 (same)
SELECT 	sum(hm.totalintensity)
FROM 	case_study.hourlyintensities_merged hm
WHERE 	hm.id = 1624580081
		AND hm.activity_hour = '03:00:00'
		
-- 15 (same)		
SELECT 	sum(hm.totalintensity)
FROM 	case_study.hourlyactivity_merged hm
WHERE 	hm.id = 1624580081
		AND hm.activity_hour = '03:00:00'


-- Adding info about table data
		
ALTER TABLE case_study.dailyactivity_merged 
ADD COLUMN about varchar(50);		

UPDATE 	case_study.dailyactivity_merged 
SET 	about = 'Daily Activity'
WHERE 	about IS NULL;
		
SELECT * FROM case_study.dailyactivity_merged ;


ALTER TABLE case_study.heartrate_seconds_merged 
ADD COLUMN about varchar(50);		

UPDATE 	case_study.heartrate_seconds_merged
SET 	about = 'Heart Rate'
WHERE 	about IS NULL;
		
SELECT * FROM case_study.heartrate_seconds_merged;


ALTER TABLE case_study.hourlyactivity_merged 
ADD COLUMN about varchar(50);		

UPDATE 	case_study.hourlyactivity_merged
SET 	about = 'Hourly Activity'
WHERE 	about IS NULL;
		
SELECT * FROM case_study.hourlyactivity_merged;


ALTER TABLE case_study.sleepday_merged 
ADD COLUMN about varchar(50);		

UPDATE 	case_study.sleepday_merged
SET 	about = 'Sleep'
WHERE 	about IS NULL;
		
SELECT * FROM case_study.sleepday_merged;


ALTER TABLE case_study.weightloginfo_merged 
ADD COLUMN about varchar(50);		

UPDATE 	case_study.weightloginfo_merged
SET 	about = 'Weight Log'
WHERE 	about IS NULL;
		
SELECT * FROM case_study.weightloginfo_merged;


----------- END VALIDATING

-- So, the tables to be used on the next phases are:
/*
	dailyactivity_merged
	heartrate_seconds_merged
	hourlyactivity_merged
	sleepday_merged
	weightloginfo_merged
 */	

