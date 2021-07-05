-- Fungsi trigger total likes
CREATE OR REPLACE FUNCTION update_like() RETURNS TRIGGER AS $update_like$
	BEGIN
		IF (TG_OP = 'DELETE') THEN
			IF ((SELECT post_total_like FROM instagram.post WHERE post_id = OLD.post_id) > 0) THEN
				UPDATE instagram.post
				SET post_total_like = post_total_like - 1
				WHERE post_id = OLD.post_id;
			END IF;
			RETURN OLD;
		ELSE
			UPDATE instagram.post
			SET post_total_like = post_total_like + 1
			WHERE post_id = NEW.post_id;
			RETURN NEW;
		END IF;
	END;
$update_like$ LANGUAGE plpgsql;

--- Trigger total_like
CREATE TRIGGER update_like BEFORE INSERT OR DELETE ON instagram.likes
FOR EACH ROW EXECUTE FUNCTION update_like();
