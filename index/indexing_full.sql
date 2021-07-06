CREATE UNIQUE INDEX idx_user_id ON instagram.user(user_id);
CREATE UNIQUE INDEX idx_post_id ON instagram.post(post_id);
CREATE UNIQUE INDEX idx_comments_id ON instagram.comments(com_id);
CREATE UNIQUE INDEX idx_story_id ON instagram.story(story_id);
CREATE UNIQUE INDEX idx_archive_story_id ON instagram.archive_story(arcs_id);
CREATE UNIQUE INDEX idx_hashtag_id ON instagram.hashtag(hashtag_id);
CREATE UNIQUE INDEX idx_tag_id ON instagram.tag(tag_id);
CREATE UNIQUE INDEX idx_jenis_post_id ON instagram.jenis_post(jp_id);

CREATE INDEX idx_user_username ON instagram.user(user_username);
CREATE INDEX idx_user_name ON instagram.user(user_name);
CREATE INDEX idx_user_email ON instagram.user(user_email);
CREATE INDEX idx_tag_name ON instagram.tags(tag_name);
CREATE INDEX idx_hashtag_text ON instagram.hashtags(hashtag_text);

