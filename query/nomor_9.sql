-- Melihat seorang user berada di post yang memiliki hashtag apa saja. 
-- (hubungan user dan hashtag)
--- User yang ditampilkan mengandung: H%
EXPLAIN ANALYZE SELECT u.user_username, u.user_name, h.hashtag_text
FROM instagram.user u INNER JOIN instagram.post p ON u.user_id = p.user_id
	INNER JOIN instagram.post_hashtag ph ON p.post_id = ph.post_id
	INNER JOIN instagram.hashtags h ON ph.hashtag_id = h.hashtag_id
WHERE u.user_username LIKE 'H%' OR u.user_name LIKE 'H%'