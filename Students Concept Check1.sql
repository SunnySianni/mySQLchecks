USE university;

CREATE TABLE students (
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL, 
	age TINYINT,
    enrollment_date DATE,
    is_active BOOLEAN);
    
		
    