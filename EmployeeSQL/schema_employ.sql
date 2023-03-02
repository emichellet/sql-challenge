departments
-
dept_no PK VARCHAR
dept_name VARCHAR

employees
-
employ_no PK int
employ_title_id VARCHAR FK >- titles.title_id
birth_date VARCHAR
first_name VARCHAR
last_name VARCHAR
sex VARCHAR
hire_date VARCHAR

-- Because the dept_employ table is a many-many relationship, two primary keys are needed
dept_employ
-
emp_no PK int FK >- employees.emp_no
dept_no PK VARCHAR FK >- departments.dept_no

-- The dept_manager table is many-many relationship, so two primary keys are needed
dept_manager
-
dept_no PK VARCHAR FK >- departments.dept_no
employ_no PK int FK >- employees.employ_no

salaries
-
employ_no PK int FK - employees.employ_no
salary int

titles
-
title_id PK VARCHAR
title VARCHAR