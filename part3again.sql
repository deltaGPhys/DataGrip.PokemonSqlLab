-- What is each pokemon's primary type?
select p.name, t.name from pokemons as p inner join types as t on p.primary_type = t.id;
-- What is Rufflet's secondary type?
select p.name, t.name from pokemons as p inner join types as t on p.primary_type = t.id where p.name = 'Rufflet';
-- What are the names of the pokemon that belong to the trainer with trainerID 303?
select p.name from pokemons as p inner join pokemon_trainer as t on p.id=t.pokemon_id where t.trainerID = 303;
-- How many pokemon have a secondary type Poison
select count(*) from pokemons as p inner join types as t on p.secondary_type = t.id where t.name = 'Poison';
-- What are all the primary types and how many pokemon have that type?
select t.name, count(p.primary_type) from pokemons as p inner join types as t on p.primary_type = t.id group by p.primary_type;
-- How many pokemon at level 100 does each trainer with at least one level 100 pokemon have? (Hint: your query should not display a trainer
select count(pt.trainerID) from pokemons as p inner join pokemon_trainer pt on p.id = pt.pokemon_id where pokelevel >= 100 group by pt.trainerID;
-- How many pokemon only belong to one trainer and no other?
select count(p.id) from pokemons as p inner join pokemon_trainer pt on p.id = pt.pokemon_id group by pt.pokemon_id having (count(p.id) = 1)
select count(*) from (select count(p.id) from pokemons as p inner join pokemon_trainer pt on p.id = pt.pokemon_id group by pt.pokemon_id having (count(p.id) = 1)) as subq;