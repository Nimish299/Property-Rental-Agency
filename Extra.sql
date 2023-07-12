

-- Trigger to prevent insertion of null values in User1 table
CREATE OR REPLACE TRIGGER UserNotNullCheck
BEFORE INSERT OR UPDATE ON User1
FOR EACH ROW
BEGIN
  IF :NEW.userid IS NULL OR :NEW.password IS NULL OR :NEW.name IS NULL OR :NEW.age IS NULL OR :NEW.Doorno IS NULL OR :NEW.pincode IS NULL OR :NEW.state IS NULL OR :NEW.city IS NULL OR :NEW.street IS NULL THEN
    RAISE_APPLICATION_ERROR(-20002, 'Null values not allowed in User1 table.');
  END IF;
END;
/

-- Trigger to prevent insertion of duplicate phonenumbers for a user in Phoneno1 table
CREATE OR REPLACE TRIGGER PhonenoUniqueCheck
BEFORE INSERT ON Phoneno1
FOR EACH ROW
DECLARE
  cnt NUMBER;
BEGIN
  SELECT COUNT(*) INTO cnt FROM Phoneno1 WHERE userid = :NEW.userid AND phoneno = :NEW.phoneno;
  IF cnt > 0 THEN
    RAISE_APPLICATION_ERROR(-20003, 'Duplicate phonenumbers not allowed for a user in Phoneno1 table.');
  END IF;
END;
/

-- Trigger to prevent insertion of null values in Rent1 table
CREATE OR REPLACE TRIGGER RentNotNullCheck
BEFORE INSERT OR UPDATE ON Rent1
FOR EACH ROW
BEGIN
  IF :NEW.userid IS NULL OR :NEW.Pid IS NULL OR :NEW.startdate IS NULL OR :NEW.enddate IS NULL OR :NEW.Agencycomm IS NULL OR :NEW.rentpermon IS NULL OR :NEW.yearlyhike IS NULL THEN
    RAISE_APPLICATION_ERROR(-20004, 'Null values not allowed in Rent1 table.');
  END IF;
END;
/


