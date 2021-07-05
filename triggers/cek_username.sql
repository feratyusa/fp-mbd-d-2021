-- Fungsi Trigger cek username
CREATE OR REPLACE FUNCTION cek_username() RETURNS TRIGGER AS $cek_username$
	 BEGIN
	 	IF((SELECT user_username FROM instagram.user WHERE user_username = NEW.user_username)
		  	IS NOT NULL) THEN
			RAISE EXCEPTION 'Username telah ada';
		ELSE
			RETURN NEW;
		END IF;
	 END;
$cek_username$ LANGUAGE plpgsql;

-- Trigger cek username
CREATE TRIGGER cek_username BEFORE INSERT ON instagram.user
FOR EACH ROW EXECUTE FUNCTION cek_username();