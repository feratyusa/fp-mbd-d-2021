-- Fungsi trigger total comments
CREATE OR REPLACE FUNCTION update_comments() RETURNS TRIGGER AS $update_comments$
	BEGIN
		IF (TG_OP = 'DELETE') THEN
			IF ((SELECT post_total_comment FROM instagram.post WHERE post_id = OLD.post_id) > 0) THEN
				UPDATE instagram.post
				SET post_total_comment = post_total_comment - 1
				WHERE post_id = OLD.post_id;
			END IF;
			RETURN OLD;
		ELSE
			UPDATE instagram.post
			SET post_total_comment = post_total_comment + 1
			WHERE post_id = NEW.post_id;
			RETURN NEW;
		END IF;
	END;
$update_comments$ LANGUAGE plpgsql;

--- Trigger total_comments
CREATE TRIGGER update_comments BEFORE INSERT OR DELETE ON instagram.comments
FOR EACH ROW EXECUTE FUNCTION update_comments();
