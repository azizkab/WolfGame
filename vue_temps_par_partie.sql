-- vue qui affiche le temps passe par chaque joueur dans chaque partie

CREATE VIEW ALL_PLAYERS_ELAPSED_GAME AS
SELECT 
    p.username,  -- pseudo du joueur
    g.name AS nom_partie,  -- nom de la partie
    COUNT(DISTINCT gp2.id_game_player) AS nb_participants,  -- nb total de joueurs dans la partie
    MIN(m.action_time) AS debut,  -- premiere action du joueur dans la partie
    MAX(m.action_time) AS fin,  -- derniere action du joueur dans la partie
    EXTRACT(EPOCH FROM MAX(m.action_time) - MIN(m.action_time)) AS temps_ecoule  -- duree totale en secondes

FROM players p

JOIN game_players gp ON gp.id_player = p.id_player  -- relie joueur a ses parties
JOIN games g ON g.id_game = gp.id_game  -- recupere les infos de la partie
JOIN game_players gp2 ON gp2.id_game = g.id_game  -- compte les joueurs dans la partie
LEFT JOIN moves m ON m.id_game_player = gp.id_game_player  -- recupere les deplacements du joueur

GROUP BY p.username, g.name;  -- groupe par joueur et par partie
