-- récupérer les posts les plus likés 
SELECT
    post_id,
    count(user_id)
FROM
    like_posts
GROUP BY
    post_id;

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

SELECT posts.content AS commentaire, like_posts.post_id AS id_like
FROM posts 
INNER JOIN like_posts
ON like_posts.post_id = posts.id;

-- Affichage des followers 

SELECT uf.pseudo AS follower_pseudo, uf2.pseudo AS followed_pseudo
FROM follow f
JOIN users uf ON f.user_follow = uf.id
JOIN users uf2 ON f.user_followed = uf2.id;




