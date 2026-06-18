DESCRIBE matches_men_clean;

-- Quantas vezes as seleções venceram partidas como mandantes
SELECT
    home_team_std,
    SUM(home_team_win)
FROM matches_men_clean
GROUP BY home_team_std;


/* =====================================
   TOP 10 SELEÇÕES COM MAIS VITÓRIAS
===================================== */
SELECT
    selecao,
    SUM(vitoria) AS total_vitorias
FROM
(
    SELECT
        home_team_std AS selecao,
        home_team_win AS vitoria
    FROM matches_men_clean

    UNION ALL

    SELECT
        away_team_std AS selecao,
        away_team_win AS vitoria
    FROM matches_men_clean
) AS resultados
GROUP BY selecao
ORDER BY total_vitorias DESC
LIMIT 10;


/* =====================================
   MELHORES APROVEITAMENTOS EM COPAS 
   ===================================== */
   SELECT
    selecao,
    COUNT(*) AS total_jogos,
    SUM(vitoria) AS total_vitorias,
    ROUND((SUM(vitoria) / COUNT(*)) * 100, 2) AS aproveitamento_percentual
FROM
(
    SELECT
        home_team_std AS selecao,
        home_team_win AS vitoria
    FROM matches_men_clean

    UNION ALL

    SELECT
        away_team_std AS selecao,
        away_team_win AS vitoria
    FROM matches_men_clean
) AS resultados
GROUP BY selecao
HAVING total_jogos >= 20
ORDER BY aproveitamento_percentual DESC
LIMIT 10;
   
   