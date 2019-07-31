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


-- ALTER TABLE dishes ADD COLUMN user_id INTEGER;
-- ALTER TABLE comments ADD COLUMN user_id INTEGER;

-- \d dishes

-- INSERT INTO dishes (title, image_url) VALUES ('pudding','https://tmbidigitalassetsazure.blob.core.windows.net/secure/RMS/attachments/37/1200x1200/Old-Fashioned-Chocolate-Pudding_EXPS_TCBBZ18_2626_B05_04_6b.jpg');

INSERT INTO fails (title, location, tags, image_url, user_id) VALUES
