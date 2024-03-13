
CREATE TABLE groupe(
  id SERIAL PRIMARY KEY,
  name varchar(200) NOT NULL,
  image varchar(200),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE roles(
  id SERIAL PRIMARY KEY,
  groupe_id BIGINT,
  role varchar(200),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    role_id BIGINT REFERENCES roles(id) ON DELETE SET NULL,
    pseudo varchar(200) NOT NULL,
    image varchar(200),
    email varchar(200) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    post_id BIGINT REFERENCES posts(id) ON DELETE SET NULL,
    user_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    groupe_id BIGINT REFERENCES groupe(id) ON DELETE SET NULL,
    content TEXT NOT NULL,
    image varchar(200),
    tags varchar(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE like_posts(
  user_id BIGINT,
  post_id BIGINT,
  CONSTRAINT fk_users
  FOREIGN KEY(user_id)
  REFERENCES users(id) ON DELETE SET NULL,
  CONSTRAINT fk_posts
  FOREIGN KEY(post_id)
  REFERENCES posts(id) ON DELETE SET NULL
);

CREATE TABLE follow(
  user_follow BIGINT,
  user_followed BIGINT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_user_follow
  FOREIGN KEY(user_follow)
  REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT fk_user_followed
  FOREIGN KEY(user_followed)
  REFERENCES users(id) ON DELETE CASCADE
);

