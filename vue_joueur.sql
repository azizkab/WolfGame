-- vue qui affiche les infos sur les joueurs

CREATE VIEW ALL_PLAYERS AS
SELECT 
    p.username,  -- pseudo du joueur
    COUNT(DISTINCT gp.id_game) AS nb_parties,  -- nombre de parties jouees
    COUNT(m.id_move) AS nb_tours,  -- nombre de tours joues
    MIN(gp.joined_at) AS premiere_participation,  -- date de la premiere participation
    MAX(m.action_time) AS derniere_action  -- date de la derniere action

FROM players p

JOIN game_players gp ON gp.id_player = p.id_player  -- relie les joueurs aux parties

LEFT JOIN moves m ON m.id_game_player = gp.id_game_player  -- recupere les deplacements s'il y en a

GROUP BY p.username  -- groupe par joueur

ORDER BY nb_parties, premiere_participation, derniere_action, p.username;  -- tri final
