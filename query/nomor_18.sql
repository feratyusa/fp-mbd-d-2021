-- Menampilkan jumlah like dan comment pada post 
-- dengan user yang memiliki following lebih dari 10
SELECT p.post_id, u.user_id, p.post_total_like, p.post_total_comment
FROM instagram.user u INNER JOIN instagram.post p ON u.user_id = p.post_id
WHERE u.user_total_following > 10;