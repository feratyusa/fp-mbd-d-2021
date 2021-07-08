-- Fungsi Trigger auto add user to tags
CREATE OR REPLACE FUNCTION add_user_to_tags() RETURNS TRIGGER AS $add_user_to_tags$
	BEGIN
		IF (TG_OP = 'DELETE') THEN
			DELETE FROM instagram.tags WHERE user_id = OLD.user_id;
			RETURN OLD;
		ELSE
			INSERT INTO instagram.tags(tag_name) VALUES (NEW.user_id);
			RETURN NEW;
		END IF;
	END;
$add_user_to_tags$ LANGUAGE plpgsql;

-- Trigger auto add user to tags
CREATE TRIGGER add_user_to_tags AFTER INSERT OR DELETE ON instagram.user
FOR EACH ROW EXECUTE FUNCTION add_user_to_tags();