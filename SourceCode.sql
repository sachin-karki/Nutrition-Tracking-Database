Create schema Project;
Use Project;

CREATE TABLE gym (
    gymid 			CHAR(5)			NOT NULL,
    gymname 			VARCHAR(30)		NOT NULL,
    gymlocation 		VARCHAR(30) 		NOT NULL,
    startdate 			DATE 				NOT NULL,
    PRIMARY KEY (gymid)
);
CREATE TABLE customer (
    customerid 		CHAR(3) 			NOT NULL,
    customername 		VARCHAR(40) 		NOT NULL,
    gender 			CHAR(10) 			NOT NULL,
    gymid CHAR(5) NOT NULL,
    PRIMARY KEY (customerid),
    FOREIGN KEY (gymid) REFERENCES gym (gymid)
);
CREATE TABLE basicinfo (
    email 			VARCHAR(50) 		NOT NULL,
    weight 			VARCHAR(10)		NOT NULL,
    height 			VARCHAR(10) 		NOT NULL,
    dateofbirth 		DATE 				NOT NULL,
    maritalstatus 		CHAR(15) 			NOT NULL,
    customerid 		CHAR(3) 			NOT NULL,
    PRIMARY KEY (email),
    FOREIGN KEY (customerid) REFERENCES customer (customerid)
);
CREATE TABLE custphone (
    phonenumber 		VARCHAR(12) 		NOT NULL,
    customerid 		CHAR(3) 			NOT NULL,
    FOREIGN KEY (customerid) REFERENCES customer (customerid)
);
CREATE TABLE food (
    foodid 			VARCHAR(3) 		NOT NULL,
    foodtype			CHAR(15) 			NOT NULL,
    amount 			FLOAT 			NOT NULL,
    caloriesconsumed 	FLOAT 			NOT NULL,
    macronutrients 		CHAR(20) 			NOT NULL,
    PRIMARY KEY (foodid)
);
CREATE TABLE consumes (
    customerid 		CHAR(3) 			NOT NULL,
    foodid 			VARCHAR(3) 		NOT NULL,
    FOREIGN KEY (customerid) REFERENCES customer (customerid),
    FOREIGN KEY (foodid)	REFERENCES food (foodid)
);
CREATE TABLE exercise (
    workoutid 			VARCHAR(3) 		NOT NULL,
    workouttype 		CHAR(40) 			NOT NULL,
    duration 			VARCHAR(20) 		NOT NULL,
    caloriesburned 		FLOAT	 		NOT NULL,
    PRIMARY KEY (workoutid)
);
CREATE TABLE has (
    gymid 			CHAR(5) 			NOT NULL,
    workoutid 			VARCHAR(3) 		NOT NULL,
    FOREIGN KEY (gymid) REFERENCES gym (gymid),
    FOREIGN KEY (workoutid) REFERENCES exercise (workoutid)
);