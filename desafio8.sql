SELECT
	artist.name_artist AS artista,
	album.name_album AS album
FROM
	SpotifyClone.artist AS artist
INNER JOIN
	SpotifyClone.album AS album
ON
	album.artist_id = artist.artist_id
WHERE
	artist.name_artist = 'Elis Regina'
ORDER BY
	album.name_album;
