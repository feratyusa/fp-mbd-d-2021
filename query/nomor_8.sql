-- Menampilkan post yang dicomment oleh user yang memiliki username 
-- dengan mengandung string tertentu.
--- User yang dicari: F%
SELECT u.user_username, u.user_name, p.post_id, p.post_caption, c.com_text
FROM instagram.user u INNER JOIN instagram.comments c ON u.user_id = c.user_id
	INNER JOIN instagram.post p ON c.post_id = p.post_id
WHERE u.user_username LIKE 'F%' OR u.user_name LIKE 'F%'
