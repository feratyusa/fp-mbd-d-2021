--Fungsi auto increment id
--- Fungsi auto increment user_id
CREATE OR REPLACE FUNCTION auto_increment_id() RETURNS TRIGGER $increment_id$
	BEGIN
		IF ((SELECT count(*) FROM instagram.user) IS NULL) THEN
			NEW.user_id = 1;
		ELSE
			NEW.user_id = (SELECT user_id FROM instagram.user ORDER BY user_id DESC LIMIT 1)+1
		END IF;
		RETURN NEW;
	END;
$increment_id$ LANGUAGE plpgsql;

--- Trigger auto increment user_id
CREATE TRIGGER user_increment_id BEFORE INSERT ON instagram.user
FOR EACH ROW EXECUTE FUNCTION auto_increment_id();


-- Fungsi Trigger Update 'date_updated' setiap melakukan update
CREATE OR REPLACE FUNCTION new_date_updated() RETURNS TRIGGER AS $update$
	BEGIN
		NEW.date_updated = current_timestamp;
		RETURN NEW;
	END;
$update$ LANGUAGE plpgsql;

-- Trigger update timestamp
--- u/ Tabel User
CREATE TRIGGER user_date_updated AFTER INSERT ON instagram.user
FOR EACH ROW EXECUTE FUNCTION new_date_updated();

--- u/ Tabel Post
CREATE TRIGGER post_date_updated AFTER UPDATE OF instagram.post
FOR EACH ROW EXECUTE FUNCTION new_date_updated();

--- u/ Tabel Comments
CREATE TRIGGER comments_date_updated AFTER UPDATE ON instagram.comments
FOR EACH ROW EXECUTE FUNCTION new_date_updated();

--- u/ Tabel Likes
CREATE TRIGGER likes_date_updated AFTER UPDATE ON instagram.likes
FOR EACH ROW EXECUTE FUNCTION new_date_updated();

--- u/ Tabel Story
CREATE TRIGGER story_date_updated AFTER UPDATE ON instagram.story
FOR EACH ROW EXECUTE FUNCTION new_date_updated();

--- u/ Tabel Archive Story
CREATE TRIGGER archive_story_date_updated AFTER UPDATE ON instagram.archive_story
FOR EACH ROW EXECUTE FUNCTION new_date_updated();

--
