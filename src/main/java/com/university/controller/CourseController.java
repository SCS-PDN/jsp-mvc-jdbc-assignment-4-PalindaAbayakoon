package com.university.controller;

import com.university.dao.CourseDAO;
import com.university.dao.RegistrationDAO;
import com.university.model.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CourseController {

    @Autowired
    private CourseDAO courseDAO;
    @Autowired
    private RegistrationDAO registrationDAO;

    // GET /courses - fetch all courses from DB and show in courses.jsp
    @GetMapping("/courses")
    public String listCourses(Model model) {
        List<Course> courses = courseDAO.findAll();
        model.addAttribute("courses", courses);
        return "courses";
    }

    // POST /register/{courseId} - enroll the logged-in student in a course
    @PostMapping("/register/{courseId}")
    public String registerCourse(@PathVariable("courseId") int courseId,
                                 HttpSession session,
                                 Model model,
                                 RedirectAttributes ra) {

        Integer studentId = (Integer) session.getAttribute("studentId");
        if (studentId == null) {
            return "redirect:/login";
        }

        // Check for duplicate registration
        if (registrationDAO.exists(studentId, courseId)) {
            ra.addFlashAttribute("error", "You are already registered for this course.");
            return "redirect:/courses";
        }

        // Look up course name for the success page
        Course course = courseDAO.findById(courseId);
        if (course == null) {
            ra.addFlashAttribute("error", "Course not found.");
            return "redirect:/courses";
        }

        // Save registration to DB
        registrationDAO.register(studentId, courseId);

        // Show success.jsp with course details
        model.addAttribute("courseName", course.getName());
        model.addAttribute("instructor", course.getInstructor());
        model.addAttribute("credits", course.getCredits());
        return "success";
    }
}
