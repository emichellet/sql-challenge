CREATE TABLE titles(
		title_id VARCHAR PRIMARY KEY,
		title VARCHAR NOT NULL
);


CREATE TABLE departments(
		dept_no VARCHAR PRIMARY KEY,
		dept_name VARCHAR
);


CREATE TABLE employees(
		employ_no INT PRIMARY KEY,
		employ_title_id VARCHAR NOT NULL,
		birth_date VARCHAR NOT NULL,
		first_name VARCHAR NOT NULL,
		last_name VARCHAR NOT NULL,
		sex VARCHAR NOT NULL,
		hire_date VARCHAR NOT NULL,
		FOREIGN KEY (employ_title_id) REFERENCES titles(title_id)
);


-- Because the dept_employ table is a many-many relationship, two primary keys are needed
CREATE TABLE dept_employ(
		employ_no INT NOT NULL,
		dept_no VARCHAR NOT NULL,
		PRIMARY KEY (employ_no, dept_no),
		FOREIGN KEY (employ_no) REFERENCES employees(employ_no),
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


CREATE TABLE salaries(
		employ_no INT PRIMARY KEY,
		salary INT NOT NULL,
		FOREIGN KEY (employ_no) REFERENCES employees(employ_no)
);



-- The dept_manager table is also a many-many relationship, therefore, two primary keys are required again
CREATE TABLE dept_manager(
		dept_no VARCHAR NOT NULL,
		employ_no INT NOT NULL,
		PRIMARY KEY(dept_no, employ_no),
		FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
		FOREIGN KEY(employ_no) REFERENCES employees(employ_no)
);