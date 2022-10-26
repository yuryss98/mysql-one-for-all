SELECT
	MIN(plan.plan_value) AS faturamento_minimo,
    MAX(plan.plan_value) AS faturamento_maximo,
    ROUND(AVG(plan.plan_value), 2) AS faturamento_medio,
    ROUND(SUM(plan.plan_value), 2) AS faturamento_total
FROM
	SpotifyClone.user AS user
INNER JOIN
	SpotifyClone.plan AS plan
ON
	user.plan_id = plan.plan_id;