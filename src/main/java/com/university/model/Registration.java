package com.university.model;

public class Registration {
    private int regId;
    private int studentId;
    private int courseId;
    private String date;

    // Extra fields populated via JOIN queries (not DB columns)
    private String courseName;
    private String studentName;

    public Registration() {}

    public int getRegId() { return regId; }
    public void setRegId(int regId) { this.regId = regId; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public int getCourseId() { return courseId; }
    public void setCourseId(int courseId) { this.courseId = courseId; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getCourseName() { return courseName; }
    public void setCourseName(String courseName) { this.courseName = courseName; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }
}
