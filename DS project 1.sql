create database olympicsdb;
use olympicsdb;
show tables;
select * from olympics;  -- A
select name ,medal from olympics; -- B
select count(id) from olympics; -- C
select * from olympics 
where medal='Gold'; -- D


select * from olympics
where medal='Silver'
order by year;  -- E



select team
from olympics
where medal='Gold' 
group by team
having count(medal)>50; -- G



select name,count(medal) 
from olympics
group by name
order by count(medal) desc
limit 1;  -- I

select event
from olympics
where event like '%Freestyle%'; -- J

select name,sport
from olympics
group by sport,name
order by count(medal) desc
limit 3; -- K

SELECT
    name,year,
    COUNT(*) AS total_medals
FROM
    olympics
GROUP BY
    name, year
HAVING
    COUNT(*) > 1; -- L


select * from olympics;

select team 
from olympics 
where season='summer' and season='winter' and medal='Gold';-- M

SELECT team as country,
MAX(year) - MIN(year) AS year_difference
FROM olympics
GROUP BY team;  -- N

SELECT
    team,
    AVG(total_medals) AS avg_medals_per_athlete
FROM (
    SELECT
        team,
        name,
        COUNT(*) AS total_medals
    FROM
        olympics
    GROUP BY
        team, name
) AS AthleteMedalCounts
GROUP BY
    team; -- O



SELECT name,event
FROM olympics
WHERE medal= 'Silver'
AND event IN (
        SELECT event
        FROM olympics
        WHERE medal = 'Gold'
    )
    AND name IN (
        SELECT name
        FROM olympics
        WHERE medal= 'Gold'
    );  -- P

    
   select * from olympics;    
   
   select team as country
   from olympics
   where sport is not null
   group by country
   having count(sport)>10;  -- S
   

SELECT name, sport, MIN(year) AS start_year
FROM Olympics
GROUP BY name, sport
HAVING COUNT(DISTINCT year) >= 3; -- T