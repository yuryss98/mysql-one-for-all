SELECT
	music.name_music AS nome,
	COUNT(history.music_id) AS reproducoes
FROM
	SpotifyClone.user AS user
INNER JOIN
	SpotifyClone.reproduction_history AS history
ON
	history.user_id = user.user_id
INNER JOIN
	SpotifyClone.plan AS plan
ON
	plan.plan_id = user.plan_id
INNER JOIN
	SpotifyClone.music AS music
ON
	music.music_id = history.music_id
WHERE
	plan.plan_type IN ('gratuito', 'pessoal')
GROUP BY
	nome
ORDER BY
	nome;
