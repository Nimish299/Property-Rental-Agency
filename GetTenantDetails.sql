CREATE OR REPLACE PROCEDURE GetTenantDetails (
    Pid_in IN NUMBER
) AS
    CURSOR tenant_cur IS
        SELECT u.name, u.age, u.Doorno, u.street, u.city, u.state, u.pincode, t.category
        FROM User1 u
        JOIN Rent1 r ON u.userid = r.userid
        JOIN Tenant1 t ON r.userid = t.userid
        WHERE r.Pid = Pid_in;
        
    v_tenant tenant_cur%ROWTYPE;
BEGIN
    OPEN tenant_cur;
    
    -- Print column headers
    DBMS_OUTPUT.PUT_LINE('Tenant Name | Age | Door No. | Street | City | State | Pincode | Category');
    
    -- Loop through the cursor and print each tenant's details
    LOOP
        FETCH tenant_cur INTO v_tenant;
        EXIT WHEN tenant_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_tenant.name || ' | ' || v_tenant.age || ' | ' || v_tenant.Doorno || ' | ' ||
                             v_tenant.street || ' | ' || v_tenant.city || ' | ' || v_tenant.state || ' | ' ||
                             v_tenant.pincode || ' | ' || v_tenant.category);
    END LOOP;
    
    CLOSE tenant_cur;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error getting tenant details: ' || SQLERRM);
END GetTenantDetails;
/


      execute GetTenantDetails (1003);
       execute GetTenantDetails (1004);
