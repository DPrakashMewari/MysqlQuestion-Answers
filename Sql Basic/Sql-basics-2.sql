# Multiple join 
#Can you use two joins to pair each character name with the actor who plays them? Select the columns: character.name, actor.name

select character.name,actor.name from 
character inner join character_actor
on character.id = character_actor.character_id
inner join actor
on character_actor.actor_id = actor.id

# MuLltiple Join with Where 
# Can you return a list of characters and TV shows that are not named "Willow Rosenberg" and not in the show "How I Met Your Mother"?
select character.name,tv_show.name
from character 
Inner join character_tv_show
on character.id = character_tv_show.character_id
inner join tv_show
on character_tv_show.tv_show_id = tv_show.id where character.name != "Willow Rosenberg" and tv_show.name != "How I Met Your Mother";


# Left Join 
# Can you use left joins to match character names with the actors that play them? Select the columns: character.name, actor.name
select character.name, actor.name from
character  left join  character_actor  on character.id = character_actor.character_id
left join actor 
on character_actor.actor_id = actor.id;

# Using alias for Short naming it !! 
#  Can you use left joins to match character names with the actors that play them, and use aliases to make the query shorter? The aliases for character, character_actor, and actor should be c, ca, and a.
select c.name , a.name from character as c 
left join character_actor as ca  on
c.id = ca.character_id
left join actor  as a
on ca.actor_id = a.id;

# Columns alias 
# Can you use left joins to match character names with the actors that play them, and use aliases to call the two columns returned character and actor?
select character.name as character, actor.name as actor from
character  left join  character_actor  on character.id = character_actor.character_id
left join actor 
on character_actor.actor_id = actor.id;

# Self Join 
# Can you run a query that returns the name of an employee and the name of their boss? Use column aliases to make the columns employee_name and boss_name.
select emp1.name as employee_name,emp2.name as boss_name 
from  employees as emp1
inner join employees as emp2
on emp1.boss_id = emp2.id;

# Like
# Can you run a query that returns "Robot" followed by a year between 2000 and 2099? (So 2015 is a valid value at the end, but 2123 is not.)
select * from robots where name Like "%200%";

# Case
# Can you return the results with a column named sound that returns "talk" for humans, "bark" for dogs, and "meow" for cats?
select *,
case 
       when species  = "human" then "talk"
       when species = "dog" then "bark"
       else "meow"
END as sound from friends_of_pickles;


# Substr with like  it takes colname , index , total n value
# Can you return all of the robots that are located in NY?
select * from robots where substr(location,-2) like "NY";

# Coalesce takes column as many value it compare and return first value where it not found null !
# Suppose that a fighter's tank could count as a weapon, and it would take precedence over the gun and the sword. Could you find each fighter's weapon in that scenario?
 select name, coalesce(tank,gun,sword) as weapon  from fighters

