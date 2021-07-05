-- Fungsi Trigger cek tag
CREATE OR REPLACE FUNCTION cek_tag() RETURNS TRIGGER AS $cek_tag$
	 BEGIN
	 	IF((SELECT tag_name FROM instagram.tags WHERE tag_name = NEW.tag_name)
		  	IS NOT NULL) THEN
			RETURN OLD;
		ELSE
			RETURN NEW;
		END IF;
	 END;
$cek_tag$ LANGUAGE plpgsql;

-- Trigger cek tag
CREATE TRIGGER cek_tag BEFORE INSERT ON instagram.tags
FOR EACH ROW EXECUTE FUNCTION cek_tag();