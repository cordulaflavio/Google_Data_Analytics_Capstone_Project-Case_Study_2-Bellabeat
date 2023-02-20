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
ADD COLUMN dat date,
ADD COLUMN day_name varchar (15),
ADD COLUMN tim varchar(8); 

UPDATE case_study.heartrate_seconds_merged hsm 
SET dat = to_date(hsm."Time",'mm/dd/yyyy')
WHERE hsm."Time" IS NOT NULL;

UPDATE case_study.heartrate_seconds_merged hsm 
SET day_name = to_char(dat, 'day')
WHERE hsm.dat IS NOT NULL;

UPDATE case_study.heartrate_seconds_merged hsm 
SET tim = to_char(to_timestamp(hsm."Time",'mm/dd/yyyy hh12:mi:ss AM,PM'),'hh24:mi:ss')
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



