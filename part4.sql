-- this ranking system uses both the number of trained Pokemon and their average level, weighting the level more heavily
select p.name as 'Pokemon Name', t.trainername as 'Trainer Name', pt.pokelevel as 'Level', types.name as 'Primary Type', secTypes.name as 'Secondary Type'
from pokemons as p
inner join types on p.primary_type = types.id
inner join types as secTypes on p.secondary_type = secTypes.id
inner join pokemon_trainer as pt on p.id = pt.pokemon_ID
inner join trainers as t on t.trainerID=pt.trainerID
inner join
    (select trainerID, avg(pokelevel), count(pokelevel) * round(avg(pokelevel) * (avg(maxhp) + avg(attack) + avg(defense) + avg(spatk) + avg(spdef) + avg(speed))) as score
    from pokemon_trainer
    group by trainerID
    order by score DESC) as score on score.trainerID = t.trainerID
group by pt.trainerID,pt.pokemon_id,pt.pokelevel
order by score.score DESC;
