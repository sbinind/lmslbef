CREATE DATABASE IF NOT EXISTS lmsdb;
USE lmsdb;

-- admin_master_table
CREATE TABLE admin_master_table (
    full_name NVARCHAR(50) NULL,
    username NVARCHAR(50) NOT NULL,
    password NVARCHAR(50) NULL,
    PRIMARY KEY (username)
);

-- course_master_table
CREATE TABLE course_master_table (
    course_id CHAR(10) NOT NULL,
    course_name NVARCHAR(MAX) NULL,
    language NVARCHAR(50) NULL,
    instructor NVARCHAR(MAX) NULL,
    category NVARCHAR(MAX) NULL,
    lectures CHAR(10) NULL,
    upload_date NVARCHAR(50) NULL,
    course_duration CHAR(10) NULL,
    course_details NVARCHAR(MAX) NULL,
    course_img_link NVARCHAR(MAX) NULL,
    PRIMARY KEY (course_id)
);

-- enrol_master_table
CREATE TABLE enrol_master_table (
    user_id NVARCHAR(50) NULL,
    user_name NVARCHAR(50) NULL,
    course_id NVARCHAR(50) NULL,
    course_name NVARCHAR(50) NULL,
    lecturer_name NVARCHAR(50) NULL
);

-- instructor_master_table
CREATE TABLE instructor_master_table (
    instructor_id CHAR(10) NOT NULL,
    instructor_name NVARCHAR(50) NULL,
    PRIMARY KEY (instructor_id)
);

-- messsage_master_table
CREATE TABLE messsage_master_table (
    id INT AUTO_INCREMENT NOT NULL,
    name NVARCHAR(50) NULL,
    email NVARCHAR(50) NULL,
    message NVARCHAR(MAX) NULL,
    phone NVARCHAR(50) NULL,
    PRIMARY KEY (id)
);

-- user_master_table
CREATE TABLE user_master_table (
    full_name NVARCHAR(50) NULL,
    email_id NVARCHAR(50) NOT NULL,
    password NVARCHAR(50) NULL,
    phone CHAR(10) NULL,
    PRIMARY KEY (email_id)
);
