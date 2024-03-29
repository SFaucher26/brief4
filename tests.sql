-- TESTS DES REQUETES POUR LA REALISATION DU RESEAU SOCIAL

-- création d'un profil / update / delete
INSERT INTO
    users (pseudo, image, email)
VALUES
    ('Sfaucher', 'bestphoto.png', 'sfaucher@test.fr');

-- modification du profil 
UPDATE users
SET
    pseudo = 'SandrineFaucher'
WHERE
    id = 21;

-- supprimer le profil 
DELETE FROM users
WHERE
    id = 21;

-- création d'un post 
INSERT INTO
    posts (user_id, content, image, tags)
VALUES
    (
        22,
        'Je suis un post destiné à rentrer dans une base de données',
        'imageSql.png',
        '#développeur'
    );

-- liker un post
INSERT INTO like_posts (user_id, post_id) 
VALUES (11,11);

-- poster un commentaire 
INSERT INTO posts (post_id, user_id, content)
VALUES (
    11, 
    22, 
    'je suis le commmentaire du post n°11 de SFaucher'
);

-- poster un commentaire sur un commentaire
INSERT INTO posts (post_id, user_id, content)
VALUES (
    12, 
    22, 
    'je suis le commmentaire du post n°11 de SFaucher'
);

-- liker un commentaire
INSERT INTO like_posts (user_id, post_id)
VALUES (
    13,
    11
), 
(
    13,
    12
);

-- Afficher les commmentaires avec leurs like

SELECT posts.content AS commentaire, count(like_posts.post_id) AS id_like
FROM posts 
INNER JOIN like_posts
ON like_posts.post_id = posts.id
GROUP BY posts.content;

-- Afficher le fil d'actualités avec les commentaires les plus récents et les plus likés
CREATE VIEW fil_actu AS
SELECT 
posts.content AS commentaire, 
posts.created_at AS date, 
COUNT(like_posts.post_id) AS id_like 
FROM 
posts 
INNER JOIN 
like_posts ON like_posts.post_id = posts.id 
GROUP BY 
posts.content, posts.created_at
ORDER BY 
id_like DESC, date DESC;


-- Afficher le pseudo des followers et des followed

SELECT uf.pseudo AS follower_pseudo, uf2.pseudo AS followed_pseudo
FROM follow f
JOIN users uf ON f.user_follow = uf.id
JOIN users uf2 ON f.user_followed = uf2.id;

-- Afficher le nombre de follow pour une personne suivie 

SELECT count(uf.id) AS follower_id, uf2.pseudo AS followed_pseudo
FROM follow f
RIGHT JOIN users uf ON f.user_follow = uf.id
RIGHT JOIN users uf2 ON f.user_followed = uf2.id
GROUP BY uf2.id;

-- création d'une view pour ne pas recommencer la requete à chaque fois

CREATE VIEW followers AS
SELECT count(uf.id) AS follower_id, uf2.pseudo AS followed_pseudo
FROM follow f
RIGHT JOIN users uf ON f.user_follow = uf.id
RIGHT JOIN users uf2 ON f.user_followed = uf2.id
GROUP BY uf2.id;

-- filtrer des auteurs (par exemple dont le pseudo commence par un 'B')

SELECT pseudo
FROM users
WHERE pseudo LIKE 'B%';

-- filtrer par mots clés 

SELECT tags
FROM posts
WHERE tags IS NOT NULL;

-- récupérer les posts les plus likés 
SELECT
    post_id,
    count(user_id)
FROM
    like_posts
GROUP BY
    post_id;


-- récupérer les posts les plus récents 

SELECT content FROM posts ORDER BY created_at DESC;

-- trier des posts par mots clés

SELECT content FROM posts 
WHERE content LIKE '%uis%';

-- récupérer un post par sa date 

SELECT to_char(created_at, 'dd-mm-yyyy')
FROM posts
WHERE to_char(created_at, 'dd-mm-yyyy') LIKE '14%';

-- créer un groupe 
INSERT INTO groupe (name, image)
VALUES 
(
    'Super Testeur',
    'imageTesteur.png'
);
  
-- insérer des users et désigner des roles dans le groupe

INSERT INTO users_groupe (user_id, role_id, groupe_id)
VALUES (
    13,
    11,
    9
),
(
    14,
    12,
    9
),
(
    15,
    14,
    9
),
(
    18,
    14,
    9
);

-- Affichage des groupes 

SELECT count(ug.user_id) AS users, g.name AS name_groupe
FROM users_groupe ug
JOIN users  ON users.id = ug.user_id
JOIN groupe g ON g.id = ug.groupe_id
GROUP BY g.name; 

-- Afficher les users et leurs roles dans le groupe

SELECT ug.user_id AS users, g.name AS name_groupe, r.role AS role
FROM users_groupe ug
JOIN users  ON users.id = ug.user_id
JOIN groupe g ON g.id = ug.groupe_id
JOIN roles r ON r.id= ug.role_id;

-- Afficher les users qui appartiennent à un groupe avec leurs posts


SELECT 
u.pseudo AS Utilisateur,
g.name AS groupeName,
p.content AS postUtilisateur
FROM 
users u
JOIN 
posts p ON u.id = p.user_id
JOIN 
users_groupe ug ON u.id = ug.user_id
JOIN 
groupe g ON ug.groupe_id = g.id;

-- Afficher tous les users pour visualiser 
-- ceux qui appartiennent à un groupe ou non (afin de gérer)
-- le mode privé / public

SELECT 
u.pseudo AS Utilisateur,
COALESCE(g.name, 'Aucun groupe') AS Nom_groupe,
p.content AS post_utilisateur
FROM 
users u
JOIN 
posts p ON u.id = p.user_id
LEFT JOIN 
users_groupe ug ON u.id = ug.user_id
LEFT JOIN 
groupe g ON ug.groupe_id = g.id;

-- paginer les posts 
-- page 1
SELECT * FROM posts
WHERE post_id IS NULL
LIMIT 5 OFFSET 0;

-- page 2 
SELECT * FROM posts
WHERE post_id IS NULL
LIMIT 5 OFFSET 5;

-- récupérer les commentaires de posts 
SELECT * FROM posts 
WHERE post_id IS NOT NULL;
