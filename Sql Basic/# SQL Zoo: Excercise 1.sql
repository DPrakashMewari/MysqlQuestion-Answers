# SQL Zoo: 
Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

#. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

#  Select the code which produces this table
name	population
Bahrain	1234571
Swaziland	1220000
Timor-Leste	1066409

SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000


#       SELECT name, population
      FROM world
      WHERE name LIKE "Al%"

Table-E
Albania	3200000
Algeria	32900000

# 3. Select the code which shows the countries that end in A or L

SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l'

# 4 SELECT name,length(name)
FROM world
WHERE length(name)=5 and region='Europe'

name	length(name)
Italy	5
Malta	5
Spain	5

# SELECT name, area*2 FROM world WHERE population = 64000

Andorra	936

# 6. Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000

SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000

# Select the code that shows the population density of China, Australia, Nigeria and France

SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia')

# Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
SELECT name FROM world
WHERE population >= 200000000

# Give the name and the per capita GDP for those countries with a population of at least 200 million.

select name,GDP/population from world where population >= 200000000 

# 
Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.

select name,population/1000000 from world WHERE continent = 'South America'

# Show the name and population for France, Germany, Italy

select name,population from world where name in ('France','Germany','Italy')


#Show the countries which have a name that includes the word 'United'
select name from world where name like '%united%'

select name from world where name like '%united%'

# Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

select name,population,area from world where area > 3000000 or population > 250000000






