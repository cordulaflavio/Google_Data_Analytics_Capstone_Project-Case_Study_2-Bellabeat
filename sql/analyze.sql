-- So, the tables to be used on the next phases are:
/*
	dailyactivity_merged
	heartrate_seconds_merged
	hourlyactivity_merged
	sleepday_merged
	weightloginfo_merged
 */	

		
SELECT 'dailyactivity' as activity, count(DISTINCT dm.id)  FROM case_study.dailyactivity_merged dm
UNION 
SELECT 'heartrate' as activity, count(DISTINCT hsm.id) FROM case_study.heartrate_seconds_merged hsm
UNION 
SELECT 'hourlyactivity' as activity, count(DISTINCT hm.id) FROM case_study.hourlyactivity_merged hm
UNION 
SELECT 'sleep' as activity, count(DISTINCT sm.id) FROM case_study.sleepday_merged sm 
UNION 
SELECT 'weight' as activity, count(DISTINCT wm.id) FROM case_study.weightloginfo_merged wm 
ORDER BY 2 DESC, 1 ASC


-- There are 33 different users (participants). All 33 have data on daily activity and hourly activity. 24 users have data on sleep, 14 on 
-- heartrate and only 8 have data on weight.  

-- 27,2% of users do not use the smartwatch while sleeping. 
-- charging? Not comfortable? Do the users know about this "sleep" functionality? Is it worth it?
	
-- 57,5% of users do not use the smartwatch for heart rate monitoring

-- 75,7% of users do not use the smartwatch for weight log
-- Is the manual input difficult?


SELECT * 
FROM case_study.weightloginfo_merged wm 
WHERE ismanualreport IS TRUE 

-- 41 out of 67 (61,1%)inputs on weight log information were manually reported. That makes me assume that 26 inputs were obtained automatically.
-- So, ether the users do not trust the "auto-collected weight data" functionality or they don’t know to use it properly.



SELECT 	round((avg(veryactiveminutes+fairlyactiveminutes+lightlyactiveminutes))/60::NUMERIC,2) AS active_time,
		round((avg(sedentaryminutes))/60::NUMERIC,2) AS sedentary_time,
		24-round((avg(veryactiveminutes+fairlyactiveminutes+lightlyactiveminutes+sedentaryminutes))/60::NUMERIC,2) AS no_use
FROM case_study.dailyactivity_merged dm 

-- Using the daily activity data (it has all the users)
-- 3,79 hours of smartwatch active use (on avg)
-- 16,52 hours of smartwatch sedentary use (on avg)
-- Total average smartwatch use is 20,31 hours
-- So, 3,69 hours of no use at all (on avg)


SELECT 	activity_hour, 
		avg(calories) AS avg_calories,
		avg(steptotal) AS avg_steps 
FROM 	case_study.hourlyactivity_merged hm 
GROUP BY activity_hour 
-- ORDER BY 2 DESC 
ORDER BY 3 DESC 

-- can not get much info from this!
