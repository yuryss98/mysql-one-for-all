SELECT
	name_music AS nome_musica,
    CASE
        WHEN name_music LIKE '%Bard%' THEN REPLACE(name_music, 'Bard', 'QA')
        WHEN name_music LIKE '%Amar%' THEN REPLACE(name_music, 'Amar', 'Code Review')
        WHEN name_music LIKE '%Pais%' THEN REPLACE(name_music, 'Pais', 'Pull Requests')
        WHEN name_music LIKE '%SOUL%' THEN REPLACE(name_music, 'SOUL', 'CODE')
        WHEN name_music LIKE '%SUPERSTAR%' THEN REPLACE(name_music, 'SUPERSTAR', 'SUPERDEV')
    END AS novo_nome
FROM
	SpotifyClone.music
HAVING
	novo_nome IS NOT NULL
ORDER BY
	name_music DESC;
	