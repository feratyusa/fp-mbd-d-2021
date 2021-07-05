-- Fungsi Trigger cek email
CREATE OR REPLACE FUNCTION cek_email() RETURNS TRIGGER AS $cek_email$
	 BEGIN
	 	IF((SELECT user_email FROM instagram.user WHERE user_email = NEW.user_email)
		  	IS NOT NULL) THEN
			RAISE EXCEPTION 'Email sudah ada';
		ELSE
			RETURN NEW;
		END IF;
	 END;
$cek_email$ LANGUAGE plpgsql;

-- Trigger cek email
CREATE TRIGGER cek_email BEFORE INSERT ON instagram.user
FOR EACH ROW EXECUTE FUNCTION cek_email();