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
