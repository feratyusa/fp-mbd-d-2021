-- Menampilkan seluruh tag username dari post dengan id tertentu
SELECT p.post_id, t.tag_id, u.user_username
FROM instagram.post p INNER JOIN instagram.post_tag pt ON p.post_id = pt.post_id
	INNER JOIN instagram.tags t ON pt.tag_id = t.tag_id
	INNER JOIN instagram.user u ON t.user_id = u.user_id
WHERE p.post_id = 5;