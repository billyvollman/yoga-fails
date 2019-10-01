CREATE DATABASE yogafails;

CREATE TABLE fails (
    id SERIAL PRIMARY KEY,
    title VARCHAR(300),
    location VARCHAR(1000),
    tags VARCHAR(1000),
    image_url TEXT,
    user_id VARCHAR(300),
    created_at TIMESTAMPTZ
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(300),
    firstname VARCHAR(1000),
    lastname VARCHAR(1000),
    street_address VARCHAR(10000),
    city VARCHAR(10000),
    postcode INTEGER,
    country VARCHAR(10000),
    email VARCHAR(10000),
    password_digest VARCHAR(400)
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    body TEXT,
    fail_id INTEGER,
    user_id INTEGER
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    fail_id INTEGER,
    user_id INTEGER
);


ALTER TABLE users ADD COLUMN avatar TEXT;

UPDATE users SET avatar = 'https://instagram.fmel8-1.fna.fbcdn.net/vp/2821b7946b9970a2a9733b64fcacb684/5E3B2DFD/t51.2885-19/s150x150/28150832_204861536925604_5328085111701241856_n.jpg?_nc_ht=instagram.fmel8-1.fna.fbcdn.net' WHERE id = 1;

UPDATE users SET avatar = 'https://instagram.fmel8-1.fna.fbcdn.net/vp/fc379efb6bb7658f0038472f43edc500/5E2FD99E/t51.2885-15/e35/29088977_129714284437521_2843433444199890944_n.jpg?_nc_ht=instagram.fmel8-1.fna.fbcdn.net' WHERE id = 11;

UPDATE users SET avatar = 'https://instagram.fmel8-1.fna.fbcdn.net/vp/da05d53c1d91cc56758b232eb0e3af27/5E2E0BE2/t51.2885-15/e35/37507994_987679334748036_4779484346432188340_n.jpg?_nc_ht=instagram.fmel8-1.fna.fbcdn.net' WHERE id = 2;

UPDATE users SET avatar = 'https://instagram.fmel8-1.fna.fbcdn.net/vp/34cc6f5418f055b3e0ad10499dcd14d5/5E3A227C/t51.2885-15/e35/32178412_1514877285301572_5562805551169011712_n.jpg?_nc_ht=instagram.fmel8-1.fna.fbcdn.net' WHERE id = 3;

UPDATE users SET avatar = 'https://instagram.fmel8-1.fna.fbcdn.net/vp/a3566cc405abbd1989aa79845d10e9c2/5E3A8488/t51.2885-15/e35/47112998_491403994718499_1228115342024461639_n.jpg?_nc_ht=instagram.fmel8-1.fna.fbcdn.net' WHERE id = 4;

UPDATE users SET avatar = 'https://instagram.fmel8-1.fna.fbcdn.net/vp/d96b4c28c8be9ee9e65779b2aa22e665/5E28AEDA/t51.2885-15/e35/47584098_277943256230669_537676925440551063_n.jpg?_nc_ht=instagram.fmel8-1.fna.fbcdn.net' WHERE id = 24;

-- ALTER TABLE dishes ADD COLUMN user_id INTEGER;
-- ALTER TABLE comments ADD COLUMN user_id INTEGER;

-- \d dishes

-- INSERT INTO dishes (title, image_url) VALUES ('pudding','https://tmbidigitalassetsazure.blob.core.windows.net/secure/RMS/attachments/37/1200x1200/Old-Fashioned-Chocolate-Pudding_EXPS_TCBBZ18_2626_B05_04_6b.jpg');

INSERT INTO fails (title, location, tags, image_url, user_id) VALUES

INSERT INTO likes (id, fail_id, user_id) VALUES (1, 3, 1)