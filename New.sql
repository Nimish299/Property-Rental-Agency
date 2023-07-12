
CREATE TABLE User1 (
  userid NUMBER PRIMARY KEY,
  password VARCHAR(10),
  aid NUMBER,
  name VARCHAR(10),
  age INT,
  Doorno NUMBER,
  pincode INT,
  state VARCHAR(10),
  city VARCHAR(10),
  street VARCHAR(10)
);

CREATE TABLE Phoneno1 (
  userid NUMBER,
  phoneno NUMBER(10),
  PRIMARY KEY(userid, phoneno),
  
);

CREATE TABLE Tenant1 (
  userid NUMBER PRIMARY KEY,
  category VARCHAR(7),

);

CREATE TABLE Rent1 (
  userid NUMBER,
  Pid NUMBER,
  startdate DATE,
  enddate DATE,
  Agencycomm NUMBER,
  rentpermon NUMBER,
  yearlyhike NUMBER,
  PRIMARY KEY(userid, Pid),
 
);

CREATE TABLE Property1 (
  Pid NUMBER PRIMARY KEY,
  plotarea NUMBER NOT NULL,
  totalarea NUMBER NOT NULL,
  history VARCHAR(20),
  yearofconst NUMBER NOT NULL,
  Address VARCHAR(20),
  dateofava DATE,
  floor INT,
  locality VARCHAR(10),
  rentpermon NUMBER
);

CREATE TABLE residential1 (
  Pid NUMBER PRIMARY KEY,
  type VARCHAR(10),
  room INT,

);

CREATE TABLE commercial1 (
  Pid NUMBER PRIMARY KEY,
  type VARCHAR(10),

);

CREATE TABLE Owner1 (
  userid NUMBER,
  category VARCHAR(7),
  Pid NUMBER,
  PRIMARY KEY(userid, Pid),

);

CREATE TABLE Manager1 (
  userid NUMBER PRIMARY KEY,
  category VARCHAR(7),
  
);

CREATE TABLE manages1 (
  userid NUMBER,
  Pid NUMBER,
  PRIMARY KEY(userid, Pid),

);

ALTER TABLE Phoneno1
ADD CONSTRAINT  fk_Phoneno_userid FOREIGN KEY (userid) REFERENCES User1(userid);

ALTER TABLE Tenant1
ADD CONSTRAINT fk_Tenant_userid FOREIGN KEY (userid) REFERENCES User1(userid);
ALTER TABLE Tenant1
ADD CONSTRAINT fk_Tenant_rent_userid FOREIGN KEY (userid) REFERENCES Rent1(userid);

ALTER TABLE Manager1
ADD CONSTRAINT fk_Manager_userid FOREIGN KEY (userid) REFERENCES User1(userid);

ALTER TABLE manages1
ADD CONSTRAINT fk_manages_userid FOREIGN KEY (userid) REFERENCES Manager1(userid);

ALTER TABLE Property1
ADD CONSTRAINT fk_Property_rent FOREIGN KEY (Pid) REFERENCES Rent1(Pid);
ALTER TABLE Property1
ADD CONSTRAINT fk_Property_owner FOREIGN KEY (Pid) REFERENCES Owner1(Pid);
ALTER TABLE Property1
ADD CONSTRAINT fk_Property_manages FOREIGN KEY (Pid) REFERENCES manages1(Pid);

ALTER TABLE residential1
ADD CONSTRAINT fk_residential_Property FOREIGN KEY (Pid) REFERENCES Property1(Pid);

ALTER TABLE commercial1
ADD CONSTRAINT fk_commercial_Property FOREIGN KEY (Pid) REFERENCES Property1(Pid);

ALTER TABLE Owner1
ADD CONSTRAINT fk_Owner_userid FOREIGN KEY (userid) REFERENCES User1(userid);


-- ALTER TABLE Phoneno 
-- ADD FOREIGN KEY(userid) REFERENCES User(userid);

-- ALTER TABLE Tenant
-- ADD FOREIGN KEY(userid) REFERENCES User(userid);
-- ALTER TABLE Tenant
-- ADD FOREIGN KEY(userid) REFERENCES Rent(userid);


-- ALTER TABLE Manager
-- ADD  FOREIGN KEY(userid) REFERENCES User(userid);

-- ALTER TABLE manages
-- ADD FOREIGN KEY(userid) REFERENCES Manager(userid);


-- ALTER TABLE Property
-- ADD FOREIGN KEY(Pid) REFERENCES Rent(Pid);
-- ALTER TABLE Property
-- ADD FOREIGN KEY(Pid) REFERENCES Owner(Pid);
-- ALTER TABLE Property
-- ADD    FOREIGN KEY(Pid) REFERENCES manages(Pid);



-- ALTER TABLE residential
-- ADD FOREIGN KEY(Pid) REFERENCES Property(Pid);

-- ALTER TABLE commercial
-- ADD FOREIGN KEY(Pid) REFERENCES Property(Pid);


-- ALTER TABLE Owner
-- ADD   FOREIGN KEY(userid) REFERENCES User(userid);

