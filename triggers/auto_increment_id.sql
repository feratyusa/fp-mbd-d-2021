--Fungsi auto increment id
--- Fungsi auto increment user_id
CREATE OR REPLACE FUNCTION user_auto_increment_id() RETURNS TRIGGER AS $user_increment_id$
	BEGIN
		IF ((SELECT count(user_id) FROM instagram.user) = 0) THEN
			NEW.user_id = 1;
		ELSE
			NEW.user_id = (SELECT user_id FROM instagram.user ORDER BY user_id DESC LIMIT 1)+1;
		END IF;
		RETURN NEW;
	END;
$user_increment_id$ LANGUAGE plpgsql;

--- Trigger auto increment user_id
CREATE TRIGGER user_increment_id BEFORE INSERT ON instagram.user
FOR EACH ROW EXECUTE PROCEDURE user_auto_increment_id();

--- Fungsi auto increment ufer_id
CREATE OR REPLACE FUNCTION user_followers_auto_increment_id() RETURNS TRIGGER AS $user_followers_increment_id$
	BEGIN
		IF ((SELECT count(ufer_id) FROM instagram.user_followers) = 0) THEN
			NEW.ufer_id = 1;
		ELSE
			NEW.ufer_id = (SELECT ufer_id FROM instagram.user_followers ORDER BY ufer_id DESC LIMIT 1)+1;
		END IF;
		RETURN NEW;
	END;
$user_followers_increment_id$ LANGUAGE plpgsql;

--- Trigger auto increment ufer_id
CREATE TRIGGER user_followers_increment_id BEFORE INSERT ON instagram.user_followers
FOR EACH ROW EXECUTE PROCEDURE user_followers_auto_increment_id();

--- Fungsi auto increment ufing
CREATE OR REPLACE FUNCTION user_following_auto_increment_id() RETURNS TRIGGER AS $user_following_increment_id$
	BEGIN
		IF ((SELECT count(ufing) FROM instagram.user_following) = 0) THEN
			NEW.ufing = 1;
		ELSE
			NEW.ufing = (SELECT ufing FROM instagram.user_following ORDER BY ufing DESC LIMIT 1)+1;
		END IF;
		RETURN NEW;
	END;
$user_following_increment_id$ LANGUAGE plpgsql;

--- Trigger auto increment ufing
CREATE TRIGGER user_following_increment_id BEFORE INSERT ON instagram.user_following
FOR EACH ROW EXECUTE PROCEDURE user_following_auto_increment_id();

--- Fungsi auto increment jp_id
CREATE OR REPLACE FUNCTION jenis_post_auto_increment_id() RETURNS TRIGGER AS $jenis_post_increment_id$
	BEGIN
		IF ((SELECT count(jp_id) FROM instagram.jenis_post) = 0) THEN
			NEW.jp_id = 1;
		ELSE
			NEW.jp_id = (SELECT jp_id FROM instagram.jenis_post ORDER BY jp_id DESC LIMIT 1)+1;
		END IF;
		RETURN NEW;
	END;
$jenis_post_increment_id$ LANGUAGE plpgsql;

--- Trigger auto increment jp_id
CREATE TRIGGER jenis_post_increment_id BEFORE INSERT ON instagram.jenis_post
FOR EACH ROW EXECUTE PROCEDURE jenis_post_auto_increment_id();

--- Fungsi auto increment post_id
CREATE OR REPLACE FUNCTION post_auto_increment_id() RETURNS TRIGGER AS $post_increment_id$
	BEGIN
		IF ((SELECT count(post_id) FROM instagram.post) = 0) THEN
			NEW.post_id = 1;
		ELSE
			NEW.post_id = (SELECT post_id FROM instagram.post ORDER BY post_id DESC LIMIT 1)+1;
		END IF;
		RETURN NEW;
	END;
$post_increment_id$ LANGUAGE plpgsql;

--- Trigger auto increment post_id
CREATE TRIGGER post_increment_id BEFORE INSERT ON instagram.post
FOR EACH ROW EXECUTE PROCEDURE post_auto_increment_id();

--- Fungsi auto increment comments_id
CREATE OR REPLACE FUNCTION comments_auto_increment_id() RETURNS TRIGGER AS $comments_increment_id$
	BEGIN
		IF ((SELECT count(com_id) FROM instagram.comments) = 0) THEN
			NEW.com_id = 1;
		ELSE
			NEW.com_id = (SELECT com_id FROM instagram.comments ORDER BY com_id DESC LIMIT 1)+1;
		END IF;
		RETURN NEW;
	END;
$comments_increment_id$ LANGUAGE plpgsql;

--- Trigger auto increment comments_id
CREATE TRIGGER comments_increment_id BEFORE INSERT ON instagram.comments
FOR EACH ROW EXECUTE PROCEDURE comments_auto_increment_id();

--- Fungsi auto increment hashtag_id
CREATE OR REPLACE FUNCTION hashtags_auto_increment_id() RETURNS TRIGGER AS $hashtags_increment_id$
	BEGIN
		IF ((SELECT count(hashtag_id) FROM instagram.hashtags) = 0) THEN
			NEW.hashtag_id = 1;
		ELSE
			NEW.hashtag_id = (SELECT hashtag_id FROM instagram.hashtags ORDER BY hashtag_id DESC LIMIT 1)+1;
		END IF;
		RETURN NEW;
	END;
$hashtags_increment_id$ LANGUAGE plpgsql;

--- Trigger auto increment hashtag_id
CREATE TRIGGER hashtags_increment_id BEFORE INSERT ON instagram.hashtags
FOR EACH ROW EXECUTE PROCEDURE hashtags_auto_increment_id();

--- Fungsi auto increment tag_id
CREATE OR REPLACE FUNCTION tags_auto_increment_id() RETURNS TRIGGER AS $tags_increment_id$
	BEGIN
		IF ((SELECT count(tag_id) FROM instagram.tags) = 0) THEN
			NEW.tag_id = 1;
		ELSE
			NEW.tag_id = (SELECT tag_id FROM instagram.tags ORDER BY tag_id DESC LIMIT 1)+1;
		END IF;
		RETURN NEW;
	END;
$tags_increment_id$ LANGUAGE plpgsql;

--- Trigger auto increment tag_id
CREATE TRIGGER tags_increment_id BEFORE INSERT ON instagram.tags
FOR EACH ROW EXECUTE PROCEDURE tags_auto_increment_id();

--- Fungsi auto increment story_id
CREATE OR REPLACE FUNCTION story_auto_increment_id() RETURNS TRIGGER AS $story_increment_id$
	BEGIN
		IF ((SELECT count(story_id) FROM instagram.story) = 0) THEN
			NEW.story_id = 1;
		ELSE
			NEW.story_id = (SELECT story_id FROM instagram.story ORDER BY story_id DESC LIMIT 1)+1;
		END IF;
		RETURN NEW;
	END;
$story_increment_id$ LANGUAGE plpgsql;

--- Trigger auto increment story_id
CREATE TRIGGER story_increment_id BEFORE INSERT ON instagram.story
FOR EACH ROW EXECUTE PROCEDURE story_auto_increment_id();

--- Fungsi auto increment archive_story_id
CREATE OR REPLACE FUNCTION arcs_auto_increment_id() RETURNS TRIGGER AS $arcs_increment_id$
	BEGIN
		IF ((SELECT count(arcs_id) FROM instagram.archive_story) = 0) THEN
			NEW.arcs_id = 1;
		ELSE
			NEW.arcs_id = (SELECT arcs_id FROM instagram.archive_story ORDER BY arcs_id DESC LIMIT 1)+1;
		END IF;
		RETURN NEW;
	END;
$arcs_increment_id$ LANGUAGE plpgsql;

--- Trigger auto increment archive_story_id
CREATE TRIGGER arcs_increment_id BEFORE INSERT ON instagram.archive_story
FOR EACH ROW EXECUTE PROCEDURE arcs_auto_increment_id();
