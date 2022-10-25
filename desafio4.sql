SELECT
	user.name_user AS usuario,
	IF (MAX(YEAR(history.reproduction_date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM 
	SpotifyClone.user AS user
INNER JOIN
	SpotifyClone.reproduction_history AS history
ON
	user.user_id = history.user_id
GROUP BY
	user.name_user
ORDER BY
	user.name_user;