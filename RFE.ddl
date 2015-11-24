-- Generated by Oracle SQL Developer Data Modeler 4.1.1.888
--   at:        2015-11-22 07:50:56 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE F15C7Approvers
  (
    effective_date       DATE NOT NULL ,
    comments             VARCHAR2 (4000) ,
    F15C7Emp_employee_id INTEGER NOT NULL ,
    F15C7Roles_role_code INTEGER NOT NULL ,
    F15C7RFE_rfe_id      INTEGER NOT NULL
  ) ;


CREATE TABLE F15C7Auth
  (
    auth_id              INTEGER NOT NULL ,
    F15C7Emp_employee_id INTEGER
  ) ;
CREATE UNIQUE INDEX F15C7Auth__IDX ON F15C7Auth
  (
    F15C7Emp_employee_id ASC
  )
  ;
ALTER TABLE F15C7Auth ADD CONSTRAINT F15C7Auth_PK PRIMARY KEY ( auth_id ) ;


CREATE TABLE F15C7Comments
  (
    comment_entry_date   DATE NOT NULL ,
    comments             VARCHAR2 (4000) NOT NULL ,
    F15C7Emp_employee_id INTEGER NOT NULL ,
    F15C7RFE_rfe_id      INTEGER NOT NULL
  ) ;


CREATE TABLE F15C7Contacts
  (
    effective_date       DATE NOT NULL ,
    comments             VARCHAR2 (4000) ,
    F15C7Emp_employee_id INTEGER NOT NULL ,
    F15C7Roles_role_code INTEGER NOT NULL ,
    F15C7RFE_rfe_id      INTEGER NOT NULL
  ) ;


CREATE TABLE F15C7Documents
  (
    document_id     INTEGER NOT NULL ,
    F15C7RFE_rfe_id INTEGER NOT NULL ,
    filename        VARCHAR2 (4000) ,
    file_mimetype   VARCHAR2 (512) ,
    file_charset    VARCHAR2 (512) ,
    file_blob BLOB ,
    file_comments VARCHAR2 (4000) ,
    tags          VARCHAR2 (4000)
  ) ;
ALTER TABLE F15C7Documents ADD CONSTRAINT F15C7Documents_PK PRIMARY KEY ( document_id ) ;


CREATE TABLE F15C7Emp
  (
    employee_id        INTEGER NOT NULL ,
    employee_name      VARCHAR2 (30) NOT NULL ,
    employee_email     VARCHAR2 (100) NOT NULL ,
    employee_office    VARCHAR2 (12) NOT NULL ,
    employee_phone     VARCHAR2 (8) NOT NULL ,
    employee_status    VARCHAR2 (1) NOT NULL ,
    system_admin_flag  CHAR (1) NOT NULL ,
    lab_director_flag  CHAR (1) NOT NULL ,
    exec_director_flag CHAR (1) NOT NULL ,
    chair_person_flag  CHAR (1) NOT NULL ,
    F15C7Labs_lab_id   INTEGER NOT NULL ,
    F15C7Auth_auth_id  INTEGER
  ) ;
CREATE UNIQUE INDEX F15C7Emp__IDX ON F15C7Emp
  (
    F15C7Auth_auth_id ASC
  )
  ;
ALTER TABLE F15C7Emp ADD CONSTRAINT F15C7Emp_PK PRIMARY KEY ( employee_id ) ;


CREATE TABLE F15C7Hist
  (
    history_id      INTEGER NOT NULL ,
    F15C7RFE_rfe_id INTEGER NOT NULL
  ) ;
ALTER TABLE F15C7Hist ADD CONSTRAINT F15C7Hist_PK PRIMARY KEY ( history_id ) ;


CREATE TABLE F15C7Labs
  (
    lab_id      INTEGER NOT NULL ,
    description VARCHAR2 (4)
  ) ;
ALTER TABLE F15C7Labs ADD CONSTRAINT F15C7Labs_PK PRIMARY KEY ( lab_id ) ;


CREATE TABLE F15C7RFE
  (
    rfe_id               INTEGER NOT NULL ,
    explanation          VARCHAR2 (4000) NOT NULL ,
    alt_protections      VARCHAR2 (4000) NOT NULL ,
    approval_review_date DATE
  ) ;
ALTER TABLE F15C7RFE ADD CONSTRAINT F15C7RFE_PK PRIMARY KEY ( rfe_id ) ;


CREATE TABLE F15C7Roles
  (
    role_code   INTEGER NOT NULL ,
    role_type   VARCHAR2 (30) NOT NULL ,
    description VARCHAR2 (500) NOT NULL
  ) ;
ALTER TABLE F15C7Roles ADD CONSTRAINT F15C7Roles_PK PRIMARY KEY ( role_code ) ;


CREATE TABLE F15C7StatCode
  (
    status_code INTEGER NOT NULL ,
    rfe_status  VARCHAR2 (30) NOT NULL ,
    description VARCHAR2 (500) NOT NULL
  ) ;
ALTER TABLE F15C7StatCode ADD CONSTRAINT F15C7StatCode_PK PRIMARY KEY ( status_code ) ;


CREATE TABLE F15C7Status
  (
    effective_date            DATE NOT NULL ,
    F15C7Hist_history_id      INTEGER NOT NULL ,
    F15C7StatCode_status_code INTEGER NOT NULL ,
    F15C7RFE_rfe_id           INTEGER NOT NULL ,
    F15C7Emp_employee_id      INTEGER NOT NULL
  ) ;


CREATE TABLE F15C7Tasks
  (
    effective_date    DATE NOT NULL ,
    task_abbreviation VARCHAR2 (15) NOT NULL ,
    task_description  VARCHAR2 (4000) NOT NULL ,
    F15C7RFE_rfe_id   INTEGER NOT NULL
  ) ;


ALTER TABLE F15C7Approvers ADD CONSTRAINT F15C7Approvers_F15C7Emp_FK FOREIGN KEY ( F15C7Emp_employee_id ) REFERENCES F15C7Emp ( employee_id ) ;

ALTER TABLE F15C7Approvers ADD CONSTRAINT F15C7Approvers_F15C7RFE_FK FOREIGN KEY ( F15C7RFE_rfe_id ) REFERENCES F15C7RFE ( rfe_id ) ;

ALTER TABLE F15C7Approvers ADD CONSTRAINT F15C7Approvers_F15C7Roles_FK FOREIGN KEY ( F15C7Roles_role_code ) REFERENCES F15C7Roles ( role_code ) ;

ALTER TABLE F15C7Auth ADD CONSTRAINT F15C7Auth_F15C7Emp_FK FOREIGN KEY ( F15C7Emp_employee_id ) REFERENCES F15C7Emp ( employee_id ) ;

ALTER TABLE F15C7Comments ADD CONSTRAINT F15C7Comments_F15C7Emp_FK FOREIGN KEY ( F15C7Emp_employee_id ) REFERENCES F15C7Emp ( employee_id ) ;

ALTER TABLE F15C7Comments ADD CONSTRAINT F15C7Comments_F15C7RFE_FK FOREIGN KEY ( F15C7RFE_rfe_id ) REFERENCES F15C7RFE ( rfe_id ) ;

ALTER TABLE F15C7Contacts ADD CONSTRAINT F15C7Contacts_F15C7Emp_FK FOREIGN KEY ( F15C7Emp_employee_id ) REFERENCES F15C7Emp ( employee_id ) ;

ALTER TABLE F15C7Contacts ADD CONSTRAINT F15C7Contacts_F15C7RFE_FK FOREIGN KEY ( F15C7RFE_rfe_id ) REFERENCES F15C7RFE ( rfe_id ) ;

ALTER TABLE F15C7Contacts ADD CONSTRAINT F15C7Contacts_F15C7Roles_FK FOREIGN KEY ( F15C7Roles_role_code ) REFERENCES F15C7Roles ( role_code ) ;

ALTER TABLE F15C7Documents ADD CONSTRAINT F15C7Documents_F15C7RFE_FK FOREIGN KEY ( F15C7RFE_rfe_id ) REFERENCES F15C7RFE ( rfe_id ) ;

ALTER TABLE F15C7Emp ADD CONSTRAINT F15C7Emp_F15C7Auth_FK FOREIGN KEY ( F15C7Auth_auth_id ) REFERENCES F15C7Auth ( auth_id ) ;

ALTER TABLE F15C7Emp ADD CONSTRAINT F15C7Emp_F15C7Labs_FK FOREIGN KEY ( F15C7Labs_lab_id ) REFERENCES F15C7Labs ( lab_id ) ;

ALTER TABLE F15C7Hist ADD CONSTRAINT F15C7Hist_F15C7RFE_FK FOREIGN KEY ( F15C7RFE_rfe_id ) REFERENCES F15C7RFE ( rfe_id ) ;

ALTER TABLE F15C7Status ADD CONSTRAINT F15C7Status_F15C7Emp_FK FOREIGN KEY ( F15C7Emp_employee_id ) REFERENCES F15C7Emp ( employee_id ) ;

ALTER TABLE F15C7Status ADD CONSTRAINT F15C7Status_F15C7Hist_FK FOREIGN KEY ( F15C7Hist_history_id ) REFERENCES F15C7Hist ( history_id ) ;

ALTER TABLE F15C7Status ADD CONSTRAINT F15C7Status_F15C7RFE_FK FOREIGN KEY ( F15C7RFE_rfe_id ) REFERENCES F15C7RFE ( rfe_id ) ;

ALTER TABLE F15C7Status ADD CONSTRAINT F15C7Status_F15C7StatCode_FK FOREIGN KEY ( F15C7StatCode_status_code ) REFERENCES F15C7StatCode ( status_code ) ;

ALTER TABLE F15C7Tasks ADD CONSTRAINT F15C7Tasks_F15C7RFE_FK FOREIGN KEY ( F15C7RFE_rfe_id ) REFERENCES F15C7RFE ( rfe_id ) ;


-- Oracle SQL Developer Data Modeler Summary Report:
--
-- CREATE TABLE                            13
-- CREATE INDEX                             2
-- ALTER TABLE                             26
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
--
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
--
-- REDACTION POLICY                         0
--
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
--
-- ERRORS                                   0
-- WARNINGS                                 0