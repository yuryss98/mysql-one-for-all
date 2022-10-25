SELECT
	music.name_music AS cancao,
    COUNT(music.name_music) AS reproducoes
FROM
	SpotifyClone.reproduction_history AS history
INNER JOIN
	SpotifyClone.music AS music
ON
	music.music_id = history.music_id
GROUP BY
	music.name_music
ORDER BY
	reproducoes DESC, cancao
LIMIT 2;