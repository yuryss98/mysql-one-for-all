SELECT
	user.name_user AS usuario,
	COUNT(re.music_id) AS `qt_de_musicas_ouvidas`,
    ROUND(SUM(music.duration_seconds / 60), 2) AS total_minutos
FROM
	SpotifyClone.user AS user
INNER JOIN
	SpotifyClone.reproduction_history AS re
ON
	re.user_id = user.user_id
INNER JOIN
	SpotifyClone.music AS music
ON
	music.music_id = re.music_id
GROUP BY
	user.name_user
ORDER BY
	user.name_user;