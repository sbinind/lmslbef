-- admin_master_table
CREATE TABLE admin_master_table (
    full_name VARCHAR(50) NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NULL,
    PRIMARY KEY (username)
);

-- course_master_table
CREATE TABLE course_master_table (
    course_id CHAR(10) NOT NULL,
    course_name VARCHAR(255) NULL,
    language VARCHAR(50) NULL,
    instructor VARCHAR(255) NULL,
    category VARCHAR(255) NULL,
    lectures CHAR(10) NULL,
    upload_date VARCHAR(50) NULL,
    course_duration CHAR(10) NULL,
    course_details VARCHAR(255) NULL,
    course_img_link VARCHAR(255) NULL,
    PRIMARY KEY (course_id)
);

-- enrol_master_table
CREATE TABLE enrol_master_table (
    user_id VARCHAR(50) NULL,
    user_name VARCHAR(50) NULL,
    course_id VARCHAR(50) NULL,
    course_name VARCHAR(50) NULL,
    lecturer_name VARCHAR(50) NULL
);

-- instructor_master_table
CREATE TABLE instructor_master_table (
    instructor_id CHAR(10) NOT NULL,
    instructor_name VARCHAR(50) NULL,
    PRIMARY KEY (instructor_id)
);

-- messsage_master_table
CREATE TABLE messsage_master_table (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NULL,
    email VARCHAR(50) NULL,
    message VARCHAR(255) NULL,
    phone VARCHAR(50) NULL,
    PRIMARY KEY (id)
);

-- user_master_table
CREATE TABLE user_master_table (
    full_name VARCHAR(50) NULL,
    email_id VARCHAR(50) NOT NULL,
    password VARCHAR(50) NULL,
    phone CHAR(10) NULL,
    PRIMARY KEY (email_id)
);

INSERT INTO admin_master_table (full_name, username, password) VALUES ('Admin User', 'admin', 'admin');