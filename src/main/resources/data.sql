-- =============================================================
--  University Course Registration System - Sample Data
--  Run AFTER schema.sql
-- =============================================================

USE university_db;

-- =============================================================
--  Sample Students  (2 students as required + 1 admin)
--  Passwords are stored as plain text for this academic demo.
--  In production, use BCrypt or similar hashing.
-- =============================================================
INSERT INTO students (name, email, password, username, role) VALUES
('Alice Johnson',   'alice@university.edu',  'alice123',  'alice',  'student'),
('Bob Smith',       'bob@university.edu',    'bob123',    'bob',    'student'),
('Admin User',      'admin@university.edu',  'admin123',  'admin',  'admin');

-- =============================================================
--  Sample Courses  (3 courses as required)
-- =============================================================
INSERT INTO courses (name, instructor, credits, course_code, description, capacity, enrolled) VALUES
('Introduction to Computer Science',
 'Dr. Sarah Connor',  3, 'CS101',
 'Foundational concepts of computing, algorithms, and programming.',
 30, 0),

('Database Management Systems',
 'Prof. John Rambo',  4, 'CS302',
 'Relational databases, SQL, normalization, and transaction management.',
 25, 0),

('Web Application Development',
 'Dr. Ellen Ripley',  3, 'CS410',
 'Full-stack web development using Java EE, Spring MVC, and JSP.',
 20, 0),

('Software Engineering Principles',
 'Prof. Alan Turing',  3, 'SE201',
 'SDLC models, design patterns, UML, and agile methodologies.',
 28, 0),

('Computer Networks',
 'Dr. Grace Hopper',  3, 'CS305',
 'Network protocols, TCP/IP, routing, and network security.',
 30, 0);

-- =============================================================
--  Sample Registrations  (Alice enrolled in CS101 and CS302)
-- =============================================================
INSERT INTO registrations (student_id, course_id, date, status) VALUES
(1, 1, NOW(), 'active'),
(1, 2, NOW(), 'active');

-- Update enrolled counts to reflect the sample registrations above
UPDATE courses SET enrolled = 1 WHERE course_code IN ('CS101', 'CS302');
