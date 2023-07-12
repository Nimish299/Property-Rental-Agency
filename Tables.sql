CREATE TABLE User1 (
  userid NUMBER PRIMARY KEY,
  password VARCHAR2(10),
  aid NUMBER UNIQUE,
  name VARCHAR2(100),
  age INT,
  Doorno NUMBER,
  pincode INT,
  state VARCHAR2(20),
  city VARCHAR2(20),
  street VARCHAR2(20)
);


CREATE TABLE Phoneno1 (
  userid NUMBER,
  phoneno NUMBER(10),
  PRIMARY KEY(userid, phoneno)
);

CREATE TABLE Tenant1 (
  userid NUMBER PRIMARY KEY,
  category VARCHAR2(10)
);

CREATE TABLE Rent1 (
  userid NUMBER,
  Pid NUMBER,
  startdate DATE,
  enddate DATE,
  Agencycomm NUMBER,
  rentpermon NUMBER,
  yearlyhike NUMBER,
  PRIMARY KEY(userid, Pid)
);

CREATE TABLE Property1 (
  Pid NUMBER PRIMARY KEY,
  plotarea NUMBER NOT NULL,
  totalarea NUMBER NOT NULL,
  history VARCHAR2(20),
  yearofconst NUMBER NOT NULL,
  Address VARCHAR2(200),
  dateofava DATE,
  floor INT,
  locality VARCHAR2(20),
  rentpermon NUMBER
);

CREATE TABLE residential1 (
  Pid NUMBER PRIMARY KEY,
  type VARCHAR2(20),
  room INT
);

CREATE TABLE commercial1 (
  Pid NUMBER PRIMARY KEY,
  type VARCHAR2(20)
);

CREATE TABLE Owner1 (
  userid NUMBER,
  category VARCHAR2(10),
  Pno NUMBER
  PRIMARY KEY  
);

CREATE TABLE Manager1 (
  userid NUMBER PRIMARY KEY,
  category VARCHAR2(10)
);

CREATE TABLE manages1 (
  userid NUMBER,
  Pid NUMBER,
  PRIMARY KEY(userid, Pid)
);


ALTER TABLE Phoneno1
ADD CONSTRAINT fk_Phoneno_userid FOREIGN KEY (userid) REFERENCES User1(userid);

ALTER TABLE Tenant1
ADD CONSTRAINT fk_Tenant_userid FOREIGN KEY (userid) REFERENCES User1(userid);


ALTER TABLE  Rent1
ADD CONSTRAINT fk_Tenant_rent_userid FOREIGN KEY (userid) REFERENCES Tenant1(userid);
ALTER TABLE Rent1
ADD CONSTRAINT fk_Property_rent FOREIGN KEY (Pid) REFERENCES Property1(Pid);

ALTER TABLE Manager1
ADD CONSTRAINT fk_Manager_userid FOREIGN KEY (userid) REFERENCES User1(userid);

ALTER TABLE manages1
ADD CONSTRAINT fk_manages_userid FOREIGN KEY (userid) REFERENCES Manager1(userid);
ALTER TABLE manages1
ADD CONSTRAINT fk_Property_manages FOREIGN KEY (Pid) REFERENCES Property1( Pid);


ALTER TABLE residential1
ADD CONSTRAINT fk_residential_Property FOREIGN KEY (Pid) REFERENCES Property1(Pid);

ALTER TABLE commercial1
ADD CONSTRAINT fk_commercial_Property FOREIGN KEY (Pid) REFERENCES Property1(Pid);

ALTER TABLE Owner1
ADD CONSTRAINT fk_Owner_userid FOREIGN KEY (userid) REFERENCES User1(userid);

ALTER TABLE Property1
ADD CONSTRAINT fk_Property_owner FOREIGN KEY ( Pid) REFERENCES Owner1( Pno);
-- ALTER TABLE Owner1
-- ADD CONSTRAINT fk_Property_owner FOREIGN KEY ( Pno) REFERENCES Property1( Pid);


