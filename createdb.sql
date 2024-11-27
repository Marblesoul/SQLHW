CREATE TABLE IF NOT EXISTS Artist (
	artistId SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS Album (
	albumId SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	YEAR INT
);

CREATE TABLE IF NOT EXISTS Song (
	songId SERIAL PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	duration INT,
	albumId INT,
	CONSTRAINT fk_Song_Album FOREIGN KEY (albumId) REFERENCES Album(albumId)
);

CREATE TABLE IF NOT EXISTS Genre (
	genreId SERIAL PRIMARY KEY,
	title VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Collection (
	collectionId SERIAL PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	YEAR INT
);

CREATE TABLE IF NOT EXISTS AlbumsByArtist (
	artist_id INT,
	album_id INT,
	CONSTRAINT pk_AlbumsByArtist PRIMARY KEY (artist_id, album_id),
	CONSTRAINT fk_AlbumsByArtist_Artist FOREIGN KEY (artist_id) REFERENCES Artist(artistId),
	CONSTRAINT fk_AlbumsByArtist_Album FOREIGN KEY (album_id) REFERENCES Album(albumId)
);

CREATE TABLE IF NOT EXISTS ArtistsByGenre (
	genre_id INT,
	artist_id INT,
	CONSTRAINT pk_ArtistsByGenre PRIMARY KEY (genre_id, artist_id),
	CONSTRAINT fk_ArtistsByGenre_Genre FOREIGN KEY (genre_id) REFERENCES Genre(genreId),
	CONSTRAINT fk_ArtistsByGenre_Artist FOREIGN KEY (artist_id) REFERENCES Artist(artistId)
);

CREATE TABLE IF NOT EXISTS SongsByCollection (
	collection_id INT,
	song_id INT,
	CONSTRAINT pk_SongsByCollection PRIMARY KEY (collection_id, song_id),
	CONSTRAINT fk_SongsByCollection_Collection FOREIGN KEY (collection_id) REFERENCES Collection(collectionId),
	CONSTRAINT fk_SongsByCollection_Song FOREIGN KEY (song_id) REFERENCES Song(songId)
);
