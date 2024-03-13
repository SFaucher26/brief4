INSERT INTO
    groupe (name, image, created_at, updated_at)
VALUES
    (
        'Pink laidies',
        'image.png',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Les randonneurs',
        'picture_default.png',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Les chanteurs',
        'image.png',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Les botanistes',
        'image.png',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );

INSERT INTO
    roles (groupe_id, role, created_at, updated_at)
VALUES
    (
        2,
        'Administrateur',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        2,
        'Super Utilisateur',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        3,
        'Modérateur',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        1,
        'Editeur',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        4,
        'Visiteur',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );

INSERT INTO
    users (
        role_id,
        pseudo,
        image,
        email,
        created_at,
        updated_at
    )
VALUES
    (
        9,
        'Bellon83',
        'image_profil.png',
        'AnaisLeBatelier@dayrep.com',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        NULL,
        'Berded63',
        'image_profil.png',
        'DominiqueDoucet@jourrapide.com',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        11,
        'Eare1970',
        'image_profil.png',
        'ZaraLeblanc@cuvox.de',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        12,
        'Inely1953',
        'image_profil.png',
        'LianeLamontagne@jourrapide.com',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        12,
        'Youncle',
        'image_profil.png',
        'OdeletteDaoust@einrot.com',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        10,
        'Frocarephey',
        'image_profil.png',
        'TheophileDagenais@einrot.com',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        12,
        'Andurn1973',
        'image_profil.png',
        'DonatienLaramee@teleworm.us',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        13,
        'Maked2000',
        'image_profil.png',
        'VivienneBousquet@armyspy.com',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        12,
        'Nowde1953',
        'image_profil.png',
        'ArthurFournier@fleckens.hu',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        10,
        'Anwave',
        'image_profil.png',
        'ThibautGarcia@dayrep.com',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );

INSERT INTO
    posts (
        post_id,
        user_id,
        groupe_id,
        content,
        image,
        tags,
        created_at,
        updated_at
    )
VALUES
    (
        NULL,
        27,
        3,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
         quis nostrud exercitation ullamco laboris nisi ut',
         'image3.png', 
         '#dolore, #laboris',
         CURRENT_TIMESTAMP,
         CURRENT_TIMESTAMP
    ),
    (
        NULL,
        30,
        2,
        'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
         Excepteur sint occaecat cupidatat non proident',
         'image3.png', 
         '#arbres, #feuille',
         CURRENT_TIMESTAMP,
         CURRENT_TIMESTAMP
    ),
    (
        NULL,
        29,
        1,
        'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore 
         eu fugiat nulla pariatur.',
         'image3.png', 
         NULL,
         CURRENT_TIMESTAMP,
         CURRENT_TIMESTAMP
    ),
    (
        NULL,
        30,
        NULL,
        'Voluptate velit esse cillum dolore eu fugiat nulla pariatur.
         Excepteur ',
         'image3.png', 
         NULL,
         CURRENT_TIMESTAMP,
         CURRENT_TIMESTAMP
    ),
    (
        NULL,
        32,
        NULL,
        'Excepteur sint occaecat cupidatat non proident',
         'image3.png', 
         '#dore, #rose',
         CURRENT_TIMESTAMP,
         CURRENT_TIMESTAMP
    );

    INSERT INTO follow (user_follow, user_followed, created_at, updated_at) 
    VALUES 
    (
        26,
        28,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        27,
        30,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        35,
        33,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );

INSERT INTO like_posts (user_id, post_id)
VALUES
(
    26,
    17
),
(
    30,
    18
),
(
    28,
    19
),
(
    31,
    20
),
(
    30,
    19
),
(
    27,
    19
),
(
    30,
    17
);