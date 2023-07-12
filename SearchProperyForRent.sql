CREATE OR REPLACE PROCEDURE SearchPropertyForRentByCity(city IN VARCHAR2) IS
BEGIN
    FOR prop IN (SELECT * FROM Property1 WHERE locality = city ) LOOP
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

EXECUTE SearchPropertyForRentByCity('Salt Lake');



CREATE OR REPLACE TRIGGER tr_Property1_Insert
AFTER INSERT ON Property1
FOR EACH ROW
DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('New property added with ID: ' || :NEW.Pid || ', located at ' || :NEW.Address);
END;
/
