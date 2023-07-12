CREATE OR REPLACE PROCEDURE CreateNewUser (
  p_userid IN User1.userid%TYPE,
  p_username IN User1.name%TYPE,
  p_password IN User1.password%TYPE,
  p_aid IN User1.aid%TYPE,
  p_age IN User1.age%TYPE,
  p_doorno IN User1.Doorno%TYPE,
  p_pincode IN User1.pincode%TYPE,
  p_state IN User1.state%TYPE,
  p_city IN User1.city%TYPE,
  p_street IN User1.street%TYPE,
  p_phoneno IN Phoneno1.phoneno%TYPE
) IS
BEGIN
  -- Insert a new record into User1 table
  INSERT INTO User1 (
    userid, password, aid, name, age, Doorno, pincode, state, city, street
  ) VALUES (
    p_userid, p_password, p_aid, p_username, p_age, p_doorno, p_pincode, p_state, p_city, p_street
  );

  -- Insert a new record into Phoneno1 table
  INSERT INTO Phoneno1 (userid, phoneno) VALUES (p_userid, p_phoneno);

  -- Commit the transaction
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('New user created with user ID: ' || p_userid);
EXCEPTION
  WHEN OTHERS THEN
    -- Rollback the transaction if there is an error
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error creating new user: ' || SQLERRM);
END;
/


-- ***********************************
-- To execute this stored procedure, you can use the following code:



BEGIN
  CreateNewUser(
    p_userid => 11,
    p_username => 'John',
    p_password => 'password',
    p_aid => 123,
    p_age => 25,
    p_doorno => 1,
    p_pincode => 123456,
    p_state => 'rajasthan',
    p_city => 'udaipur',
    p_street => 'karni vihar society',
    p_phoneno => 1234567890
  );
END;
/



-- CreateNewUser procedure trigger:


CREATE OR REPLACE TRIGGER tr_CreateNewUser
AFTER INSERT ON User1
FOR EACH ROW
BEGIN
  IF :NEW.age < 18 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Age must be greater than or equal to 18');
  END IF;
END;
/


execute CreateNewUser (  'nimish','ni','123', 12,1,123,'raj','mumbai','sd',099887766);







DECLARE
  username User1.name%TYPE := 'John';
  password User1.password%TYPE := 'password1';
  aid User1.aid%TYPE := 1234;
  age User1.age%TYPE := 25;
  doorno User1.Doorno%TYPE := 1;
  pincode User1.pincode%TYPE := 123456;
  state User1.state%TYPE := 'California';
  city User1.city%TYPE := 'Los ';
  street User1.street%TYPE := 'Main St';
  phoneno Phoneno1.phoneno%TYPE := 1234567890;
BEGIN
  CreateNewUser(username, password, aid, age, doorno, pincode, state, city, street, phoneno);
END;
/
