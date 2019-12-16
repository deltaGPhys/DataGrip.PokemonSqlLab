use pokemon;
-- What are all the types of pokemon that a pokemon can have? (there are 18)
select name from types;
-- What is the name of the pokemon with id 45? (Eevee)
select name from pokemons where id=45;
-- How many pokemon are there? (656)
select count(*) from pokemons;
-- How many types are there? (18)
select count(*) from types;
-- How many pokemon have a secondary type? (316)
select count(secondary_type) from pokemons where secondary_type is not null;
