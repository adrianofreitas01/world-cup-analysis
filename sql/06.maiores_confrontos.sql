/* MAIORES CONFRONTOS */
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