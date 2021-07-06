-- Menampilkan post dan nama pembuatnya dengan tag tertentu
--- Tag yang dicari: J%
SELECT t.tag_name, p.post_id, p.post_caption, u.user_username, u.user_name
FROM instagram.tags t INNER JOIN instagram.post_tag pt ON t.tag_id = pt.tag_id
	INNER JOIN instagram.post p ON pt.post_id = p.post_id
	INNER JOIN instagram.user u ON p.user_id = u.user_id
WHERE t.tag_name LIKE 'J%'
ORDER BY u.user_id ASC;