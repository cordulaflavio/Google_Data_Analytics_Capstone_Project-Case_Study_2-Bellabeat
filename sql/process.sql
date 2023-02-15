----------------------------------------
-- count distinct ids from tables
----------------------------------------

-- Only 33 participants
SELECT COUNT(DISTINCT id) FROM case_study.dailyactivity_merged dm; -- 33
SELECT COUNT(DISTINCT id) FROM case_study.dailycalories_merged dm2; -- 33
SELECT COUNT(DISTINCT id) FROM case_study.dailyintensities_merged dm3; -- 33
SELECT COUNT(DISTINCT id) FROM case_study.dailysteps_merged dm4; -- 33
SELECT COUNT(DISTINCT id) FROM case_study.heartrate_seconds_merged hsm; -- 14
SELECT COUNT(DISTINCT id) FROM case_study.hourlycalories_merged hm; -- 33
SELECT COUNT(DISTINCT id) FROM case_study.hourlyintensities_merged hm2; -- 33
SELECT COUNT(DISTINCT id) FROM case_study.hourlysteps_merged hm3; -- 33
SELECT COUNT(DISTINCT id) FROM case_study.minutecaloriesnarrow_merged mm; -- 33
SELECT COUNT(DISTINCT id) FROM case_study.minutecalorieswide_merged mm2; -- 33
SELECT COUNT(DISTINCT id) FROM case_study.minuteintensitiesnarrow_merged mm3; -- 33
SELECT COUNT(DISTINCT id) FROM case_study.minuteintensitieswide_merged mm4; -- 33
SELECT COUNT(DISTINCT id) FROM case_study.minutemetsnarrow_merged mm5; -- 33
SELECT COUNT(DISTINCT id) FROM case_study.minutesleep_merged mm6; -- 24
SELECT COUNT(DISTINCT id) FROM case_study.minutestepsnarrow_merged mm7; -- 33
SELECT COUNT(DISTINCT id) FROM case_study.minutestepswide_merged mm8; -- 33
SELECT COUNT(DISTINCT id) FROM case_study.sleepday_merged sm;  -- 24
SELECT COUNT(DISTINCT id) FROM case_study.weightloginfo_merged wm -- 8

-- There are 33 different ids. Either the content (description on Kaggle) is wrong, or some participants wore more than one smartwatch.
	-- I considered here 33 different users (participants) 

-- Most tables contain 33 distinct users, except for heartrate_seconds_merged with 14 and minutesleep_merged and sleepday_merged with 24. 
-- From this very simple verification, one can infer that only 14 users monitored their heartrate data and 24 (out of 33) actually used their smartwatch while sleeping.
