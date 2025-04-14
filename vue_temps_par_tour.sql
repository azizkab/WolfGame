-- vue qui montre le temps que chaque joueur a mis pour jouer a chaque tour

CREATE VIEW ALL_PLAYERS_ELAPSED_TOUR AS
SELECT 
    p.username,  -- pseudo du joueur
    g.name AS nom_partie,  -- nom de la partie
    t.number AS numero_tour,  -- numero du tour
    t.started_at,  -- debut du tour
    m.action_time,  -- moment ou le joueur a joue
    EXTRACT(EPOCH FROM m.action_time - t.started_at) AS temps_tour  -- temps mis pour jouer en secondes

FROM players p

JOIN game_players gp ON gp.id_player = p.id_player  -- relie joueur a sa partie
JOIN games g ON g.id_game = gp.id_game  -- recupere le nom de la partie
JOIN turns t ON t.id_game = g.id_game  -- recupere les tours de la partie
JOIN moves m ON m.id_turn = t.id_turn AND m.id_game_player = gp.id_game_player;  -- recupere les deplacements du joueur a ce tour
