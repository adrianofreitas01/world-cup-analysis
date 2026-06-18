-- 02_exploracao.sql

-- Quantas copas ja tiveram ?

SELECT COUNT(distinct tournament_name) as total_copas
FROM matches_men;


-- Quantos jogos de Copa ja existiram ?

SELECT COUNT(*) AS total_jogos
FROM matches_men;

-- Quantos gols ja foram marcados ?

SELECT
SUM(home_team_score + away_team_score) AS total_gols
FROM matches_men;

-- Média de gols por jogo

SELECT
ROUND(AVG(home_team_score + away_team_score),2) AS media_gols
FROM matches_men;

-- Top 5 confrontos que mais aconteceram em Copas

SELECT
    CASE
        WHEN home_team_name < away_team_name
        THEN CONCAT(home_team_name, ' vs ', away_team_name)
        ELSE CONCAT(away_team_name, ' vs ', home_team_name)
    END AS confronto,
    COUNT(*) AS total_jogos
FROM matches_men
GROUP BY confronto
ORDER BY total_jogos DESC
LIMIT 5;


-- Identificado uma inconsistencia nos dados referente a nomenclatura da Alemanha, 
-- portanto nova tabela criada para ajuste

CREATE TABLE matches_men_clean AS
SELECT
    *,
    
    CASE
        WHEN home_team_name = 'West Germany' THEN 'Germany'
        ELSE home_team_name
    END AS home_team_std,
    
    CASE
        WHEN away_team_name = 'West Germany' THEN 'Germany'
        ELSE away_team_name
    END AS away_team_std

FROM matches_men;

-- Atualização do top 5 confrontos
SELECT
    CASE
        WHEN home_team_name < away_team_name
        THEN CONCAT(home_team_std, ' vs ', away_team_std)
        ELSE CONCAT(away_team_std, ' vs ', home_team_std)
    END AS confronto,
    COUNT(*) AS total_jogos
FROM matches_men_clean
GROUP BY confronto
ORDER BY total_jogos DESC
LIMIT 5;

-- Quantidade de gols por copa

SELECT tournament_name, 
	SUM(home_team_score + away_team_score) as quantiade_de_gols
FROM matches_men_clean
GROUP BY tournament_name
ORDER by quantiade_de_gols DESC;

-- Média de gols por copa
SELECT
    tournament_name,
    SUM(home_team_score + away_team_score) AS total_gols,
    COUNT(*) AS total_jogos,
    ROUND(
        SUM(home_team_score + away_team_score) / COUNT(*),
        2
    ) AS media_gols_por_jogo
FROM matches_men_clean
GROUP BY tournament_name
ORDER BY media_gols_por_jogo DESC;

SELECT
    tournament_name,
    ROUND(
        SUM(home_team_score + away_team_score) / COUNT(*),
        2
    ) AS media_gols
FROM matches_men_clean
GROUP BY tournament_name
ORDER BY tournament_name;
