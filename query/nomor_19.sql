-- Menampilkan jumlah total size archive pada user dengan nama tertentu
SELECT u.user_id, u.user_name, arcs.arcs_total_size
FROM instagram.user u INNER JOIN instagram.archive arcs ON u.user_id = arcs.user_id
WHERE u.user_name = 'John';