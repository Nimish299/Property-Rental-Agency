CREATE OR REPLACE PROCEDURE InsertPropertyRecord (
    Pid_in IN NUMBER,
    plotarea_in IN NUMBER,
    totalarea_in IN NUMBER,
    history_in IN VARCHAR2,
    yearofconst_in IN NUMBER,
    address_in IN VARCHAR2,
    dateofava_in IN DATE,
    floor_in IN NUMBER,
    locality_in IN VARCHAR2,
    rentpermon_in IN NUMBER
) AS
BEGIN
    INSERT INTO Property1 (Pid, plotarea, totalarea, history, yearofconst, Address, dateofava, floor, locality, rentpermon)
    VALUES (Pid_in, plotarea_in, totalarea_in, history_in, yearofconst_in, address_in, dateofava_in, floor_in, locality_in, rentpermon_in);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Record inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error inserting record: ' || SQLERRM);
END InsertPropertyRecord;
/

DECLARE
    Pid_val NUMBER := 12;
    plotarea_val NUMBER := 1000;
    totalarea_val NUMBER := 1500;
    history_val VARCHAR2(20) := 'Newly constructed';
    yearofconst_val NUMBER := 2022;
    address_val VARCHAR2(20) := '123 Main St';
    dateofava_val DATE := SYSDATE;
    floor_val NUMBER := 3;
    locality_val VARCHAR2(10) := '100ft';
    rentpermon_val NUMBER := 1500;
BEGIN
    InsertPropertyRecord(Pid_val, plotarea_val, totalarea_val, history_val, yearofconst_val, address_val, dateofava_val, floor_val, locality_val, rentpermon_val);
END;
