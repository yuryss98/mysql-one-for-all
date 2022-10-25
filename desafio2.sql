SELECT
	COUNT(music.music_id) AS cancoes,
	COUNT(DISTINCT album.album_id) AS albuns,
    COUNT(DISTINCT artist.artist_id) AS artistas
FROM
	SpotifyClone.music AS music
INNER JOIN
	SpotifyClone.album AS album
ON
	album.album_id = music.album_id
INNER JOIN
	SpotifyClone.artist AS artist
ON
	album.artist_id = artist.artist_id;