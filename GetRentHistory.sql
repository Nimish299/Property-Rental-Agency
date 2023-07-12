CREATE OR REPLACE PROCEDURE GetRentHistory(prop_id IN NUMBER) IS
BEGIN
  FOR rent IN (SELECT * FROM Rent1 WHERE Pid = prop_id ORDER BY startdate DESC) LOOP
    DBMS_OUTPUT.PUT_LINE('Rent start date: ' || rent.startdate);
    DBMS_OUTPUT.PUT_LINE('Rent end date: ' || rent.enddate);
    DBMS_OUTPUT.PUT_LINE('Agency commission: ' || rent.Agencycomm);
    DBMS_OUTPUT.PUT_LINE('Rent per month: ' || rent.rentpermon);
    DBMS_OUTPUT.PUT_LINE('Yearly rent hike: ' || rent.yearlyhike);
    DBMS_OUTPUT.NEW_LINE;
  END LOOP;
END;
/

-- ***********************************
-- To execute this stored procedure, you can use the following code:

EXEC GetRentHistory(1003);



CREATE OR REPLACE TRIGGER atr_GetRentHistory
AFTER UPDATE ON Rent1
FOR EACH ROW
BEGIN
  IF :NEW.rentpermon < :OLD.rentpermon THEN
    DBMS_OUTPUT.PUT_LINE('Rent decreased from '||:OLD.rentpermon||' to '||:NEW.rentpermon);
  ELSIF :NEW.rentpermon > :OLD.rentpermon THEN
    DBMS_OUTPUT.PUT_LINE('Rent increased from '||:OLD.rentpermon||' to '||:NEW.rentpermon);
  END IF;
END;
/
