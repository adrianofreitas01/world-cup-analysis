/* =====================================
   TOP 10 SELEÇÕES COM MAIS GOLS MARCADOS
===================================== */
SELECT
    selecao,
    SUM(gols) AS total_gols
FROM
(
    SELECT
        home_team_std AS selecao,
        home_team_score AS gols
    FROM matches_men_clean

    UNION ALL

    SELECT
        away_team_std AS selecao,
        away_team_score AS gols
    FROM matches_men_clean
) AS golaços
GROUP BY selecao
ORDER BY total_gols DESC
LIMIT 10;
