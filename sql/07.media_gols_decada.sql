/* =====================================
   MÉDIA DE GOLS POR DÉCADA
===================================== */

SELECT
    FLOOR(CAST(LEFT(tournament_name, 4) AS UNSIGNED) / 10) * 10 AS decada,
    ROUND(
        SUM(home_team_score + away_team_score) / COUNT(*),
        2
    ) AS media_gols_por_jogo
FROM matches_men_clean
GROUP BY decada
ORDER BY decada;