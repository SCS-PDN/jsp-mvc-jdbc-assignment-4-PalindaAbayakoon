-- =============================================================
--  University Course Registration System - Database Schema
--  Database: university_db
-- =============================================================

-- Create and select the database
CREATE DATABASE IF NOT EXISTS university_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE university_db;

-- =============================================================
--  Table: students
--  Stores student login credentials and profile information.
-- =============================================================
CREATE TABLE IF NOT EXISTS students (
    student_id  INT            NOT NULL AUTO_INCREMENT,
    name        VARCHAR(100)   NOT NULL,
    email       VARCHAR(150)   NOT NULL UNIQUE,
    password    VARCHAR(255)   NOT NULL,
    username    VARCHAR(50)    NOT NULL UNIQUE,   -- used for login
    role        VARCHAR(20)    NOT NULL DEFAULT 'student', -- 'student' | 'admin'
    PRIMARY KEY (student_id)
) ENGINE=InnoDB;

-- =============================================================
--  Table: courses
--  Stores courses offered by the university.
-- =============================================================
CREATE TABLE IF NOT EXISTS courses (
    course_id   INT            NOT NULL AUTO_INCREMENT,
    name        VARCHAR(150)   NOT NULL,
    instructor  VARCHAR(100)   NOT NULL,
    credits     INT            NOT NULL DEFAULT 3,
    course_code VARCHAR(20)    NOT NULL UNIQUE,
    description TEXT,
    capacity    INT            NOT NULL DEFAULT 30,
    enrolled    INT            NOT NULL DEFAULT 0,
    PRIMARY KEY (course_id)
) ENGINE=InnoDB;

-- =============================================================
--  Table: registrations
--  Records student course enrollment.
--  student_id and course_id form a logical unique key for active regs.
-- =============================================================
CREATE TABLE IF NOT EXISTS registrations (
    reg_id      INT            NOT NULL AUTO_INCREMENT,
    student_id  INT            NOT NULL,
    course_id   INT            NOT NULL,
    date        DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status      VARCHAR(20)    NOT NULL DEFAULT 'active',  -- 'active' | 'dropped'
    PRIMARY KEY (reg_id),
    CONSTRAINT fk_reg_student FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    CONSTRAINT fk_reg_course  FOREIGN KEY (course_id)  REFERENCES courses(course_id)   ON DELETE CASCADE
) ENGINE=InnoDB;
