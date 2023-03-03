-- Create the table schemas

-- Create "titles" table
CREATE TABLE titles(
		"title_id" VARCHAR(5) NOT NULL,
		"title" VARCHAR(30) NOT NULL,
		CONSTRAINT "pk_titles" PRIMARY KEY (
		"title_id"
		)
);

-- Create departments table
CREATE TABLE departments(
		"dept_no" VARCHAR(5) PRIMARY KEY,
		"dept_name" VARCHAR(10)
);

-- Create employees table
CREATE TABLE employees(
		emp_no VARCHAR(10) PRIMARY KEY,
		emp_title_id VARCHAR(5) NOT NULL,
		birth_date date,
		first_name VARCHAR(45) NOT NULL,
		last_name VARCHAR(45) NOT NULL,
		sex VARCHAR(1),
		hire_date date,
		FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Create department empoyees table
-- Note: Because the dept_emp table is a many-many relationship, two primary keys are needed
CREATE TABLE dept_emp(
		emp_no VARCHAR(10) references employees(emp_no),
		dept_no VARCHAR(5),
		PRIMARY KEY (emp_no, dept_no),
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create salaries table
CREATE TABLE salaries(
		emp_no VARCHAR(10) REFERENCES employees(emp_no),
		salary INT,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


-- Create a department managers table
-- The dept_manager table is also a many-many relationship, therefore, two primary keys are required again
CREATE TABLE dept_manager(
		dept_no VARCHAR(5) references departments(dept_no),
		emp_no VARCHAR(10),
		PRIMARY KEY(dept_no, emp_no),
		FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
		FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);