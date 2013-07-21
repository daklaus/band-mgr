CREATE TABLE roles (
	name VARCHAR(512) PRIMARY KEY
);

CREATE TABLE users (
	email VARCHAR(512) PRIMARY KEY,
	first_name VARCHAR(512) NOT NULL,
	surname VARCHAR(512) NOT NULL,
	active BOOLEAN NOT NULL DEFAULT TRUE,
	password VARCHAR(512) NOT NULL
);

CREATE TABLE priviledges (
	role_name VARCHAR(512) NOT NULL REFERENCES roles(name) ON UPDATE CASCADE ON DELETE CASCADE,
	user_email VARCHAR(512) NOT NULL REFERENCES users(email) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (role_name, user_email)
);

CREATE TABLE keys (
	name VARCHAR(3) PRIMARY KEY
);

CREATE TABLE artists (
	name VARCHAR(512) PRIMARY KEY
);

CREATE TABLE instruments (
	name VARCHAR(512) PRIMARY KEY
);

CREATE TABLE songs (
	artist VARCHAR(512) REFERENCES artists(name) ON UPDATE CASCADE,
	title VARCHAR(512),
	original_key VARCHAR(3) REFERENCES keys(name) ON UPDATE CASCADE,
	PRIMARY KEY (artist, title)
);

CREATE TABLE practice_status (
	artist VARCHAR(512),
	title VARCHAR(512),
	instrument VARCHAR(512) REFERENCES instruments(name) ON UPDATE CASCADE,
	practiced NUMERIC(1) NOT NULL CHECK (practiced BETWEEN 1 AND 5),
	PRIMARY KEY (artist, title, instrument)
);

CREATE TABLE performances (
	name VARCHAR(512),
	day DATE,
	description TEXT,
	PRIMARY KEY (name, day)
);

CREATE TABLE played_at (
	song_artist VARCHAR(512) NOT NULL,
	song_title VARCHAR(512) NOT NULL,
	performance_name VARCHAR(512) NOT NULL,
	performance_day DATE NOT NULL,
	order_number NUMERIC(3) NOT NULL,
	FOREIGN KEY (song_artist, song_title) REFERENCES songs(artist, title) ON UPDATE CASCADE,
	FOREIGN KEY (performance_name, performance_day) REFERENCES performances(name, day) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (song_artist, song_title, performance_name, performance_day, order_number)
);

CREATE TABLE venue (
	name VARCHAR(512) PRIMARY KEY,
	street VARCHAR(512) NOT NULL,
	city VARCHAR(512) NOT NULL,
	postcode VARCHAR(10) NOT NULL
);

CREATE TABLE is_at (
	venue_name VARCHAR(512) NOT NULL REFERENCES venue(name) ON UPDATE CASCADE,
	performance_name VARCHAR(512) NOT NULL,
	performance_day DATE NOT NULL,
	FOREIGN KEY (performance_name, performance_day) REFERENCES performances(name, day) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (venue_name, performance_name, performance_day)
);

CREATE SEQUENCE scores_id_seq;

CREATE TABLE scores (
	id INTEGER PRIMARY KEY DEFAULT nextval('scores_id_seq'),
	song_artist VARCHAR(512) NOT NULL,
	song_title VARCHAR(512) NOT NULL,
	version NUMERIC(3) NOT NULL DEFAULT 1 CHECK (version > 0),
	key VARCHAR(3) REFERENCES keys(name) ON UPDATE CASCADE,
	create_user VARCHAR(512) NOT NULL REFERENCES users(email) ON UPDATE CASCADE,
	FOREIGN KEY (song_artist, song_title) REFERENCES songs(artist, title) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE written_for (
	instrument_name VARCHAR(512) NOT NULL REFERENCES instruments(name) ON UPDATE CASCADE,
	score_id INTEGER NOT NULL REFERENCES scores(id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (instrument_name, score_id)
);

CREATE SEQUENCE file_id_seq;

CREATE TABLE files (
	id INTEGER PRIMARY KEY DEFAULT nextval('file_id_seq'),
	name VARCHAR(512) NOT NULL,
	size_kb NUMERIC(8,2),
	link VARCHAR(512),
	content BYTEA,
	CHECK (link IS NOT NULL OR content IS NOT NULL)
);

CREATE TABLE saved_as (
	score_id INTEGER NOT NULL REFERENCES scores(id) ON UPDATE CASCADE ON DELETE CASCADE,
	file_id INTEGER NOT NULL REFERENCES files(id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (score_id, file_id)
);

CREATE TABLE rehearsal_rooms (
	name VARCHAR(512) PRIMARY KEY,
	street VARCHAR(512) NOT NULL,
	city VARCHAR(512) NOT NULL,
	postcode VARCHAR(10) NOT NULL
);

CREATE TABLE rehearsals (
	time TIMESTAMP PRIMARY KEY,
	place VARCHAR(512) NOT NULL REFERENCES rehearsal_rooms(name) ON UPDATE CASCADE
);

CREATE TABLE practiced_at (
	rehearsal_time TIMESTAMP NOT NULL REFERENCES rehearsals(time) ON UPDATE CASCADE ON DELETE CASCADE,
	song_artist VARCHAR(512) NOT NULL,
	song_title VARCHAR(512) NOT NULL,
	FOREIGN KEY (song_artist, song_title) REFERENCES songs(artist, title) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (rehearsal_time, song_artist, song_title)
);

CREATE TABLE attends (
	rehearsal_time TIMESTAMP NOT NULL REFERENCES rehearsals(time) ON UPDATE CASCADE ON DELETE CASCADE,
	user_email VARCHAR(512) NOT NULL REFERENCES users(email) ON UPDATE CASCADE,
	maybe BOOLEAN NOT NULL DEFAULT FALSE,
	PRIMARY KEY (rehearsal_time, user_email)
);

CREATE TABLE song_comments (
	song_artist VARCHAR(512) NOT NULL,
	song_title VARCHAR(512) NOT NULL,
	user_email VARCHAR(512) NOT NULL REFERENCES users(email) ON UPDATE CASCADE,
	time TIMESTAMP NOT NULL,
	content TEXT NOT NULL,
	FOREIGN KEY (song_artist, song_title) REFERENCES songs(artist, title) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (song_artist, song_title, user_email, time)
);

CREATE TABLE score_comments (
	score_id INTEGER NOT NULL REFERENCES scores(id) ON UPDATE CASCADE ON DELETE CASCADE,
	user_email VARCHAR(512) NOT NULL REFERENCES users(email) ON UPDATE CASCADE,
	time TIMESTAMP NOT NULL,
	content TEXT NOT NULL,
	PRIMARY KEY (score_id, user_email, time)
);

CREATE TABLE performance_comments (
	performance_name VARCHAR(512) NOT NULL,
	performance_day DATE NOT NULL,
	user_email VARCHAR(512) NOT NULL REFERENCES users(email) ON UPDATE CASCADE,
	time TIMESTAMP NOT NULL,
	content TEXT NOT NULL,
	FOREIGN KEY (performance_name, performance_day) REFERENCES performances(name, day) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (performance_name, performance_day, user_email, time)
);

CREATE TABLE rehearsal_comments (
	rehearsal_time TIMESTAMP NOT NULL REFERENCES rehearsals(time) ON UPDATE CASCADE ON DELETE CASCADE,
	user_email VARCHAR(512) NOT NULL REFERENCES users(email) ON UPDATE CASCADE,
	time TIMESTAMP NOT NULL,
	content TEXT NOT NULL,
	PRIMARY KEY (rehearsal_time, user_email, time)
);
