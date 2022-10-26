SELECT
	COUNT(history.music_id) AS quantidade_musicas_no_historico
FROM
	SpotifyClone.user AS user
INNER JOIN
	SpotifyClone.reproduction_history AS history
ON
	history.user_id = user.user_id
WHERE
	user.name_user = 'Barbara Liskov';
