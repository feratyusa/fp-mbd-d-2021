-- Fungsi Trigger Archive Story yang dibuat melebihi 24 jam dari current_timestamp
CREATE OR REPLACE FUNCTION auto_archive_story() RETURNS TRIGGER AS $auto_archive_stroy$
	BEGIN
		IF (current_timestamp - NEW.date_updated > interval '24 hour') THEN
			INSERT INTO instagram.archive_story(
				user_id, arcs_caption, arcs_path, arcs_size, date_created, date_updated)
				VALUES (NEW.user_id, NEW.story_caption, NEW.story_path, NEW.story_size, NEW.date_created, NEW.date_updated);
		END IF;
		RETURN NEW;
	END;
$auto_archive_stroy$ LANGUAGE plpgsql;

-- Trigger Archive Story
CREATE TRIGGER auto_archive_story AFTER INSERT OR UPDATE ON instagram.story
FOR EACH ROW EXECUTE FUNCTION auto_archive_story();