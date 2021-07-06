-- (belum)
-- Menghitung total post yang memiliki tag dengan string tertentu
--- Tag mengandung string: D%
SELECT t.tag_name, COUNT(p.post_id) AS total_tag
FROM instagram.tags t INNER JOIN instagram.post_tag pt ON t.tag_id = pt.tag_id
	INNER JOIN instagram.post p ON pt.post_id = p.post_id
WHERE t.tag_name LIKE 'D%'
GROUP BY p.post_id, p.post_caption