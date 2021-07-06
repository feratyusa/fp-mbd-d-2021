-- Mengampilkan user follower
SELECT u.user_username, uf.user_username
FROM instagram.user u INNER JOIN instagram.user_followers fu ON u.user_id = fu.user_id
	INNER JOIN instagram.user uf ON fu.follower_id = uf.user_id
WHERE u.user_username LIKE 'J%' AND uf.user_username = 'F%'