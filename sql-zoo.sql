/*select basics*/

SELECT population FROM world
	WHERE NAME = 'Germany'

SELECT name, population FROM world
  WHERE name IN ('Sweden','Norway', 'Denmark');

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
  

/*select from world*/
  
SELECT name, continent, population FROM world
  
/*Large Countires*/
  
SELECT NAME FROM world
  WHERE population>200000000 
  
 /*Per capita GDP*/
SELECT name, gdp/population
FROM world 
WHERE population>200000000

/*nobel Nobel Laureates winners from 1950*/
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
 
 /*Literature 1962*/
 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

/*Albert Einstein*/
SELECT yr, subject
  FROM nobel
  WHERE winner = 'Albert Einstein';

/*Recent Peace Prizes*/
SELECT winner FROM nobel WHERE subject = 'Peace' AND yr >= 2000;

/*Literature in the 1980's*/
SELECT yr,subject,winner
FROM nobel
WHERE subject = 'Literature'
AND yr BETWEEN 1980 AND 1989

/*Only Presidents*/
SELECT * FROM nobel
 WHERE  winner IN ('Theodore Roosevelt',
  'Woodrow Wilson',
  'Jimmy Carter',
  'Barack Obama')

/*John*/
SELECT winner FROM nobel
  WHERE winner LIKE 'John %'

/*Chemistry and Physics from different years*/
SELECT * FROM nobel 
WHERE subject = 'Physics' 
AND yr = 1980 OR subject = 'Chemistry' 
AND yr = 1984;

/*Exclude Chemists and Medics*/
SELECT * FROM nobel 
WHERE yr = 1980 AND subject 
NOT IN ('Chemistry', 'Medicine');

/*Early Medicine, Late Literature*/
SELECT * FROM nobel 
WHERE subject = 'Medicine' 
AND yr < 1910 OR subject = 'Literature' 
AND yr >= 2004;

/*Umlaut*/
SELECT * FROM nobel 
WHERE winner = 'Peter Grünberg';

/*apostrophe Eugene O'neill*/
SELECT * FROM nobel WHERE winner = 'Eugene O''Neill';

/*Knights of the realm*/
select winner, yr, subject FROM nobel WHERE
winner LIKE 'Sir%' ORDER BY yr DESC, winner;

/*Chemistry and Physics last*/
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject,winner;

