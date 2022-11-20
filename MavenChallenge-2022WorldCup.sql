USE worldcupmavenchallenge;

-- International Matches - Points tally by home team
SELECT
	 home_team
    ,SUM(CASE
			WHEN home_goals = away_goals THEN 1
			WHEN home_goals > away_goals THEN 3
			WHEN home_goals < away_goals THEN 0
			ELSE 'Error'     
		 END) AS home_team_points_tally
FROM international_matches
GROUP BY
	home_team
ORDER BY
	SUM(CASE
			WHEN home_goals = away_goals THEN 1
			WHEN home_goals > away_goals THEN 3
			WHEN home_goals < away_goals THEN 0
			ELSE 'Error'     
		 END) DESC;
   
-- International Matches - Points tally by away team
SELECT
	 away_team
    ,SUM(CASE
			WHEN home_goals = away_goals THEN 1
			WHEN home_goals < away_goals THEN 3
			WHEN home_goals > away_goals THEN 0
			ELSE 'Error'     
		 END) AS away_team_points_tally
FROM international_matches
GROUP BY
	away_team
ORDER BY
	SUM(CASE
			WHEN home_goals = away_goals THEN 1
			WHEN home_goals < away_goals THEN 3
			WHEN home_goals > away_goals THEN 0
			ELSE 'Error'     
		 END) DESC;
         
-- World Cup Matches- points tally by home team		
SELECT
	 home_team
    ,SUM(CASE
			WHEN home_goals = away_goals THEN 1
			WHEN home_goals > away_goals THEN 3
			WHEN home_goals < away_goals THEN 0
			ELSE 'Error'     
		 END) AS home_team_points_tallyWC
FROM worldcupmatches
GROUP BY
	home_team
ORDER BY
	SUM(CASE
			WHEN home_goals = away_goals THEN 1
			WHEN home_goals > away_goals THEN 3
			WHEN home_goals < away_goals THEN 0
			ELSE 'Error'     
		 END) DESC;

-- World Cup Matches- points tally by away team	
SELECT
	 away_team
    ,SUM(CASE
			WHEN home_goals = away_goals THEN 1
			WHEN home_goals < away_goals THEN 3
			WHEN home_goals > away_goals THEN 0
			ELSE 'Error'     
		 END) AS away_team_points_tallyWC
FROM worldcupmatches
GROUP BY
	away_team
ORDER BY
	SUM(CASE
			WHEN home_goals = away_goals THEN 1
			WHEN home_goals < away_goals THEN 3
			WHEN home_goals > away_goals THEN 0
			ELSE 'Error'     
		 END) DESC;

-- England Team goals by Player
SELECT
	 player
	,goals
    ,wc_goals
    ,SUM(goals + wc_goals) AS total_goals
FROM 2022worldcupsquads
WHERE
	team = 'England'
GROUP BY
	player
ORDER BY
	SUM(goals + wc_goals) DESC;

-- Total Team goals by Country (Team)
SELECT
	 team
    ,goals
    ,wc_goals
    ,SUM(goals + wc_goals) AS total_team_goals
FROM 2022worldcupsquads
GROUP BY
	team
ORDER BY
	SUM(goals + wc_goals) DESC;
    
SELECT * FROM worldcups;

-- Total number of world cups won by team
SELECT
	 winner
	,COUNT(CASE
			WHEN winner = host_country THEN 1
            ELSE 0          
          END) AS World_Cup_Titles
FROM worldcups
GROUP BY
	winner
ORDER BY
	COUNT(CASE
			WHEN winner = host_country THEN 1
            ELSE 0          
          END) DESC;
 
-- Total number of world cups won by team when hosting
SELECT
	 winner
	,COUNT(winner) AS Winner_Whilst_Hosting
FROM worldcups
WHERE
	left(host_country,3) = left(winner,3)
GROUP BY
	winner;
    
SELECT * FROM worldcups;
  
SELECT *
FROM worldcups
WHERE
	host_country = 'England';
    
SELECT *
FROM worldcupmatches
WHERE 
	year = 1966 
	AND (home_team = 'England' OR away_team = 'England');

-- World Cup Matches played
SELECT
	date
FROM worldcupmatches
WHERE
	home_team = 'England'
    OR
    away_team = 'England';

-- World CUp Matches Won
SELECT
	count(date)
FROM worldcupmatches
WHERE
	(home_team = 'England' AND home_goals > away_goals)
    OR
    (away_team = 'England' AND away_goals > home_goals);
    
-- World CUp Matches Drawn
SELECT
	count(date)
FROM worldcupmatches
WHERE
	(home_team = 'England' AND home_goals = away_goals)
    OR
    (away_team = 'England' AND away_goals = home_goals);
    
-- World CUp Matches Lost
SELECT
	count(date)
FROM worldcupmatches
WHERE
	(home_team = 'England' AND home_goals < away_goals)
    OR
    (away_team = 'England' AND away_goals < home_goals);
    
SELECT * FROM international_matches
WHERE
	(home_team = 'England' OR away_team = 'England')
    AND tournament LIKE 'FIFA%'
    AND date BETWEEN '2021-01-01' AND '2022-12-31';
    
SELECT * FROM international_matches
WHERE
	(home_team = 'England' OR away_team = 'England')
    AND date BETWEEN '2021-01-01' AND '2022-12-31';
    
SELECT * FROM 2022worldcupsquads
WHERE
	team = 'England'
    AND player LIKE '%Kane%';

SELECT
	 team
    ,AVG(age) AS Team_Age
FROM 2022worldcupsquads
GROUP BY
	team
ORDER BY
	AVG(age);
    
SELECT * 
FROM 2022worldcupmatches
	WHERE
		home_team = 'England' OR away_team = 'England';
        
SELECT
	AVG(age) AS Team_Age
FROM 2022worldcupsquads;

SELECT *
FROM worldcupmatches
	WHERE
		(home_team = 'England')
        AND
        (away_team = 'Wales' OR 'United States' OR 'Iran');
        
SELECT *
FROM worldcupmatches
	WHERE
		(home_team = 'Wales' OR 'United States' OR 'Iran')
        AND
        (away_team = 'England');
        
SELECT *
FROM worldcupmatches
WHERE
	home_team = 'England'
    OR
    away_team = 'England';

SELECT *
FROM worldcups;




    


