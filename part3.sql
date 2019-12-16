use pokemon;
-- What is each pokemon's primary type?
select p.name, t.name from pokemons as p inner join types as t on p.primary_type=t.id;
-- What is Rufflet's secondary type? (Flying)
select p.name, t.name from pokemons as p inner join types as t on p.secondary_type=t.id where p.name='Rufflet';
-- What are the names of the pokemon that belong to the trainer with trainerID 303? (Wailord, Vileplume)
select p.name from pokemons as p inner join pokemon_trainer as pt on p.id = pt.pokemon_id where pt.trainerID=303;
-- How many pokemon have a secondary type Poison? (31)
select count(*) from pokemons as p inner join types as t on p.secondary_type=t.id where t.name='Poison';
-- What are all the primary types and how many pokemon have that type?
select t.name, count(t.name) from pokemons as p join types as t on p.primary_type=t.id group by p.primary_type;
-- How many pokemon at level 100 does each trainer with at least one level 100 pokemon have? (Hint: your query should not display a trainer)
select trainerID, count(*) from pokemon_trainer where pokelevel = 100 group by trainerID;
-- How many pokemon only belong to one trainer and no other? (13)
select count(*) from (select p.name, count(p.name) from pokemons as p inner join pokemon_trainer pt on p.id = pt.pokemon_id group by pt.pokemon_id having count(pt.pokemon_id)=1) as subq;