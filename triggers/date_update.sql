-- Fungsi Trigger Update 'date_updated' setiap melakukan update
CREATE OR REPLACE FUNCTION new_date_updated() RETURNS TRIGGER AS $update$
	BEGIN
		NEW.date_updated = current_timestamp;
		RETURN NEW;
	END;
$update$ LANGUAGE plpgsql;

-- Trigger update timestamp
--- u/ Tabel User
CREATE TRIGGER user_date_updated BEFORE UPDATE ON instagram.user
FOR EACH ROW EXECUTE FUNCTION new_date_updated();

--- u/ Tabel Post
CREATE TRIGGER post_date_updated BEFORE UPDATE ON instagram.post
FOR EACH ROW EXECUTE FUNCTION new_date_updated();

--- u/ Tabel Comments
CREATE TRIGGER comments_date_updated BEFORE UPDATE ON instagram.comments
FOR EACH ROW EXECUTE FUNCTION new_date_updated();

--- u/ Tabel Likes
CREATE TRIGGER likes_date_updated BEFORE UPDATE ON instagram.likes
FOR EACH ROW EXECUTE FUNCTION new_date_updated();

--- u/ Tabel Story
CREATE TRIGGER story_date_updated BEFORE UPDATE ON instagram.story
FOR EACH ROW EXECUTE FUNCTION new_date_updated();

--- u/ Tabel Archive Story
CREATE TRIGGER archive_story_date_updated BEFORE UPDATE ON instagram.archive_story
FOR EACH ROW EXECUTE FUNCTION new_date_updated();