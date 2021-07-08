-- Fungsi Trigger Archive Story yang dibuat melebihi 24 jam dari current_timestamp
CREATE OR REPLACE FUNCTION auto_archive_story() RETURNS TRIGGER AS $auto_archive_stroy$
	BEGIN
		IF (current_timestamp - NEW.date_updated > interval '24 hour') THEN
			INSERT INTO detail_archive_story 
				VALUES(NEW.story_id, NEW.arcs_id, current_timestamp);
		END IF;
		RETURN NEW;
	END;
$auto_archive_stroy$ LANGUAGE plpgsql;

-- Trigger Archive Story
CREATE TRIGGER auto_archive_story AFTER INSERT OR UPDATE ON instagram.story
FOR EACH ROW EXECUTE FUNCTION auto_archive_story();