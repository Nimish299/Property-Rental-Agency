CREATE OR REPLACE PROCEDURE GetPropertyRecords(ownerID IN NUMBER) IS
BEGIN
    FOR prop IN (SELECT * FROM Property1  p,owner1 o  WHERE o.pno=p.pid and O.userID = ownerID) LOOP
        DBMS_OUTPUT.PUT_LINE('Property ID: ' || prop.pid);
        DBMS_OUTPUT.PUT_LINE('Address: ' || prop.Address);
		DBMS_OUTPUT.PUT_LINE('Rent per Month: ' || prop.rentpermon);
        DBMS_OUTPUT.PUT_LINE('Plot area: ' || prop.plotarea);
        DBMS_OUTPUT.PUT_LINE('Total area: ' || prop.totalarea);
        DBMS_OUTPUT.PUT_LINE('History: ' || prop.history);
		DBMS_OUTPUT.PUT_LINE('Year of construction: ' || prop.yearofconst);
		DBMS_OUTPUT.PUT_LINE('Date of availability: ' || prop.dateofava);
		DBMS_OUTPUT.PUT_LINE('Floor: ' || prop.floor);
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;
END;

-- ***********************************
-- To execute this stored procedure, you can use the following code:
EXEC GetPropertyRecords(1010); 


CREATE OR REPLACE TRIGGER tr_GetPropertyRecords
AFTER INSERT ON Owner1
FOR EACH ROW
DECLARE
    ownerID NUMBER := :NEW.userID;
BEGIN
    GetPropertyRecords(ownerID);
END;
/
