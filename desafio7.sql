SELECT
	artist.name_artist AS artista,
	album.name_album AS album,
    COUNT(user.user_id) AS seguidores
FROM
	SpotifyClone.user_artist AS user
INNER JOIN
	SpotifyClone.artist AS artist
ON
	artist.artist_id = user.artist_id
INNER JOIN
	SpotifyClone.album AS album
ON
	album.artist_id = artist.artist_id
GROUP BY
	 album.name_album, artist.name_artist
ORDER BY
	seguidores DESC, artist.name_artist, album.name_album;
