/* =====================================
SALDO DE GOLS
===================================== */
SELECT
    selecao,
    SUM(gols - gols_sofridos) AS saldo_de_gols
FROM
(
    SELECT
        home_team_std AS selecao,
        home_team_score AS gols,
        away_team_score AS gols_sofridos
    FROM matches_men_clean

    UNION ALL

    SELECT
        away_team_std AS selecao,
        away_team_score AS gols,
        home_team_score AS gols_sofridos
    FROM matches_men_clean
) AS saldo
GROUP BY selecao
ORDER BY saldo_de_gols DESC
LIMIT 10;
