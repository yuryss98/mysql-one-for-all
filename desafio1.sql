DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plan(
	plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_type VARCHAR(100) NOT NULL,
    plan_value DECIMAL(3,2) NOT NULL
);

CREATE TABLE SpotifyClone.user(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    name_user VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    subscribe_date DATE NOT NULL,
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plan(plan_id)
);

CREATE TABLE SpotifyClone.artist(
	artist_id INT PRIMARY KEY AUTO_INCREMENT,
    name_artist VARCHAR(100) NOT NULL
);

CREATE TABLE SpotifyClone.user_artist(
	user_id INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.user(user_id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
);

CREATE TABLE SpotifyClone.album(
	album_id INT PRIMARY KEY AUTO_INCREMENT,
    name_album VARCHAR(100) NOT NULL,
    release_year YEAR NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
);

CREATE TABLE SpotifyClone.music(
	music_id INT PRIMARY KEY AUTO_INCREMENT,
    name_music VARCHAR(100) NOT NULL,
    duration_seconds INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id)
);

CREATE TABLE SpotifyClone.reproduction_history(
	user_id INT NOT NULL,
	music_id INT NOT NULL,
    reproduction_date DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY(music_id, user_id),
    FOREIGN KEY (music_id) REFERENCES SpotifyClone.music(music_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.user(user_id)
);

INSERT INTO SpotifyClone.plan (plan_type, plan_value)
VALUES
	('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);
    
INSERT INTO SpotifyClone.user (name_user, age, subscribe_date, plan_id)
VALUES
	('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 2),
    ('Martin Fowler', 46, '2017-01-17', 2),
    ('Sandi Metz', 58, '2018-04-29', 2),
    ('Paulo Freire', 19, '2018-02-14', 3),
    ('Bell Hooks', 26, '2018-01-05', 3),
    ('Christopher Alexander', 85, '2019-06-05', 4),
    ('Judith Butler', 45, '2020-05-13', 4),
    ('Jorge Amado', 58, '2017-02-17', 4);
    
INSERT INTO SpotifyClone.artist (name_artist)
VALUES
	('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');
    
INSERT INTO SpotifyClone.user_artist(user_id, artist_id)
VALUES 
	(1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 1),
    (6, 6),
    (7, 6),
    (9, 3),
    (10, 2);
    
INSERT INTO SpotifyClone.album(name_album, release_year, artist_id)
VALUES
	('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);
    
INSERT INTO SpotifyClone.music(name_music, duration_seconds, album_id)
VALUES
	('BREAK MY SOUL', 279, 1),
    ('VIRGO’S GROOVE', 369, 1),
    ('ALIEN SUPERSTAR', 116, 1),
    ('Don’t Stop Me Now', 203, 2),
    ('Under Pressure', 152, 3),
    ('Como Nossos Pais', 105, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
    ('Samba em Paris', 267, 6),
    ('The Bard’s Song', 244, 7),
    ('Feeling Good', 100, 8);
    
INSERT INTO SpotifyClone.reproduction_history(user_id, music_id, reproduction_date)
VALUES
	( 1, 8, '2022-02-28 10:45:55'),
    ( 1, 2, '2020-05-02 05:30:35'),
    ( 1, 10, '2020-03-06 11:22:33'),
    ( 2, 7, '2020-01-02 07:40:33'),
    ( 2, 10, '2022-08-05 08:05:17'),
    ( 3, 2, '2020-12-05 18:38:30'),
    ( 3, 10, '2020-11-13 16:55:13'),
    ( 4, 8, '2021-08-15 17:10:10'),
    ( 5, 5, '2020-08-06 15:23:43'),
    ( 5, 8, '2022-01-09 01:44:33'),
    ( 6, 1, '2017-10-12 12:35:20'),
    ( 6, 7, '2017-01-24 00:31:17'),
    ( 7, 4, '2011-12-15 22:30:49'),
    ( 8, 4, '2012-03-17 14:56:41'),
    ( 9, 9, '2022-02-24 21:14:22'),
    ( 10, 3, '2015-12-13 08:30:22');
