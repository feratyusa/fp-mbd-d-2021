-- Fungsi Trigger cek hashtag
CREATE OR REPLACE FUNCTION cek_hashtag() RETURNS TRIGGER AS $cek_hashtag$
	 BEGIN
	 	IF((SELECT hashtag_text FROM instagram.hashtags WHERE hashtag_text = NEW.hashtag_text)
		  	IS NOT NULL) THEN
			RETURN OLD;
		ELSE
			RETURN NEW;
		END IF;
	 END;
$cek_hashtag$ LANGUAGE plpgsql;

-- Trigger cek hashtag
CREATE TRIGGER cek_hashtag BEFORE INSERT ON instagram.hashtags
FOR EACH ROW EXECUTE FUNCTION cek_hashtag();