-- Menampilkan post yang dilike oleh user yang memiliki username 
-- dengan mengandung string tertentu
--- User yang dicari: D%
SELECT u.user_username, u.user_name, p.post_id, p.post_caption
FROM instagram.user u INNER JOIN instagram.likes l ON u.user_id = l.user_id
	INNER JOIN instagram.post p ON l.post_id = p.post_id
WHERE u.user_username LIKE 'D%' OR u.user_name LIKE 'D%'