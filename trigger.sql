


-- GetPropertyRecords procedure trigger:


CREATE OR REPLACE TRIGGER tr_GetPropertyRecords
AFTER INSERT ON Owner1
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('New Owner added. Updating property records for Owner '||:NEW.userid);
  UPDATE Property1 SET ownerid = :NEW.userid WHERE Pid IN (SELECT Pid FROM Owner1 WHERE userid = :NEW.userid);
END;
/


-- GetTenantDetails procedure trigger:


CREATE OR REPLACE TRIGGER tr_GetTenantDetails
AFTER INSERT OR DELETE ON manages1
FOR EACH ROW
DECLARE
  v_property_id Property1.Pid%TYPE;
BEGIN
  IF INSERTING THEN
    v_property_id := :NEW.Pid;
  ELSE
    v_property_id := :OLD.Pid;
  END IF;
  DBMS_OUTPUT.PUT_LINE('Updating tenant details for Property '||v_property_id);
  SELECT name, age, category INTO :NEW.tenant_name, :NEW.tenant_age, :NEW.tenant_category 
  FROM User1, Tenant1, Rent1 
  WHERE Rent1.Pid = v_property_id 
  AND Rent1.userid = Tenant1.userid 
  AND Tenant1.userid = User1.userid;
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



-- SearchProperyForRent procedure trigger:


CREATE OR REPLACE TRIGGER tr_SearchProperyForRent
BEFORE INSERT ON manages1
FOR EACH ROW
DECLARE
  v_property_id Property1.Pid%TYPE;
BEGIN
  SELECT Pid INTO v_property_id FROM Property1 WHERE locality = :NEW.locality;
  IF v_property_id IS NULL THEN
    RAISE_APPLICATION_ERROR(-20002, 'No properties found in the given locality');
  END IF;
END;
/



-- GetRentHistory procedure trigger:


CREATE OR REPLACE TRIGGER tr_GetRentHistory
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
