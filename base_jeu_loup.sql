-- Table des obstacles sur le plateau
CREATE TABLE obstacles 
(
    id_obstacle SERIAL PRIMARY KEY,  --id de l'obstacle
    id_game INTEGER REFERENCES games(id_game),  --référence à la partie
    row_pos INTEGER,  --position ligne
    col_pos INTEGER   --position colonne
);

-- Table des tours de jeu
CREATE TABLE turns 
(
    id_turn SERIAL PRIMARY KEY,  --id du tour
    id_game INTEGER REFERENCES games(id_game),  --référence à la partie
    number INTEGER NOT NULL,  --numéro du tour
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  --heure de début du tour
    ended_at TIMESTAMP  --heure de fin du tour
);

-- Table des déplacements faits par les joueurs
CREATE TABLE moves 
(
    id_move SERIAL PRIMARY KEY,  --id du déplacement
    id_turn INTEGER REFERENCES turns(id_turn),  --référence au tour
    id_game_player INTEGER REFERENCES game_players(id_game_player),  --référence au joueur dans la partie
    move_row INTEGER,  --déplacement sur les lignes 
    move_col INTEGER,  --déplacement sur les colonnes 
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  --heure de l'action
    valid BOOLEAN DEFAULT TRUE  --TRUE si le déplacement est valide
);

-- Table des joueurs éliminés
CREATE TABLE eliminations 
(
    id_elimination SERIAL PRIMARY KEY,  --id de l'élimination
    id_turn INTEGER REFERENCES turns(id_turn),  --tour ou ça s'est passé
    id_game_player INTEGER REFERENCES game_players(id_game_player),  --joueur concerné
    eliminated BOOLEAN DEFAULT FALSE  --TRUE si le joueur est éliminé
);
