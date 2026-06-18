-- Ver torneios existentes
SELECT DISTINCT tournament_name
FROM matches
ORDER BY tournament_name;

-- Ver quantidade de jogos
SELECT tournament_name, COUNT(*) AS quantidade_jogos
FROM matches
GROUP BY tournament_name
ORDER BY quantidade_jogos DESC;

-- Limpar dados de jogos femininos
CREATE TABLE matches_men AS
SELECT *
FROM matches
WHERE tournament_name LIKE '%FIFA Men''s World Cup%';

-- Filtrar todas as Copas
SELECT DISTINCT tournament_name
FROM matches_men
ORDER BY tournament_name;

-- Quantidade de jogos = 1231
SELECT COUNT(*) AS total_jogos
FROM matches;

-- Quantidade de jogos masculino = 959
SELECT COUNT(*) AS total_jogos_masculino
FROM matches_men;