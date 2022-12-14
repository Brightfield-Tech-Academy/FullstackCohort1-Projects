CREATE DATABASE sms;
use sms;

CREATE TABLE Users (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    role varchar(255) NOT NULL,
    CONSTRAINT UC_User UNIQUE (email),
    PRIMARY KEY (id)
);


CREATE TABLE StudentsInfo (
    id INT  AUTO_INCREMENT PRIMARY KEY,
    uuid VARCHAR(255) UNIQUE,
    firstname VARCHAR(255) NOT NULL,
    middlename VARCHAR(255),
    lastname VARCHAR(255) NOT NULL,
    dateOfBirth VARCHAR(255) NOT NULL,
    placeOfBirth  VARCHAR(255),
    hometown VARCHAR(255) NOT NULL,
    residentialAddress VARCHAR(255),
    gpsAddress VARCHAR(255),
    gender VARCHAR(255) NOT NULL,
    religion VARCHAR(255) NOT NULL,
    formerSchool VARCHAR(255),
    previousClass VARCHAR(255) ,
    classAdmitted  VARCHAR(255) NOT NULL,
    yearOfAdmission  VARCHAR(255) NOT NULL,
    picture VARCHAR(255) NOT NULL
);

CREATE TABLE StudentHealthsInfo (
    id int NOT NULL AUTO_INCREMENT,
    studentId int,
    emergencyContactNumber varchar (255) NOT NULL,
    personalDoctorNumber varchar (255),
    medicalFitnessNote varchar (255),
    bloodGroup varchar(255) NOT NULL,
    preferedDiet varchar (255),
    unpreferedDiet varchar (255),
    PRIMARY KEY (id),
    FOREIGN KEY (studentId) references StudentsInfo(id)
);


CREATE TABLE ParentsInfo(
    id int NOT NULL AUTO_INCREMENT,
    studentId int,
    fathersName varchar(255) NOT NULL,
    fathersOccupation  varchar(255) NOT NULL,
    fathersTelephone  varchar(255) NOT NULL,
    fathersHometown  varchar(255) NOT NULL,
    mothersName  varchar(255) NOT NULL,
    mothersOccupation varchar(255) NOT NULL,
    mothersHometown  varchar(255) NOT NULL,
    houseNumber  varchar(255),
    mothersTelephone  varchar(255) NOT NULL,
    guardiansName  varchar(255),
    guardiansResidence varchar(225),
    guardiansContact varchar(225),
    PRIMARY KEY (id),
    FOREIGN KEY (studentId) references StudentsInfo(id)
);

CREATE TABLE StudentsFees(
    id int NOT NULL AUTO_INCREMENT,
    studentId int,
    termFees  varchar(255) NOT NULL,
    amountPaid  varchar(255) NOT NULL,
    term varchar(255) NOT NULL,
    academicYear varchar(255) NOT NULL,
    dateOfPayment  varchar(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (studentId) references StudentsInfo(id)
);

CREATE TABLE StudentsAcademicInfo(
    id int NOT NULL AUTO_INCREMENT,
    studentId int,
    subjects  varchar(255) NOT NULL,
    class varchar(255) NOT NULL,
    term varchar(255) NOT NULL,
    academicYear varchar(255) NOT NULL,
    position  varchar(255) NOT NULL,
    remarks varchar(255) NOT NULL,
    numberOfEnrollments int(6) NOT NULL,
    aggregate varchar(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (studentId) references StudentsInfo(id)
);


CREATE TABLE Classes(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    subjects  varchar(255) NOT NULL,
    classTeacher varchar(255) NOT NULL,
    numberOfStudents int NOT NULL,
    CONSTRAINT UC_Class UNIQUE (name),
    PRIMARY KEY (id)
);


ALTER TABLE StudentsInfo 
CHANGE previousClass previousClassId int,
CHANGE classAdmitted classAdmittedId int;

ALTER TABLE StudentsInfo
ADD currentClassId int NOT NULL;

ALTER TABLE StudentsInfo
ADD CONSTRAINT
        FOREIGN KEY (previousClassId)
        REFERENCES Classes(id);

ALTER TABLE StudentsInfo
ADD CONSTRAINT
        FOREIGN KEY (classAdmittedId)
        REFERENCES Classes(id);

ALTER TABLE StudentsInfo
ADD CONSTRAINT
        FOREIGN KEY (currentClassId)
        REFERENCES Classes(id);
