package com.university.controller;

import com.university.dao.StudentDAO;
import com.university.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private StudentDAO studentDAO;

    // GET /login - show the login form
    @GetMapping("/login")
    public String showLogin(HttpSession session) {
        if (session.getAttribute("studentId") != null) {
            return "redirect:/courses";
        }
        return "login";
    }

    // POST /login - validate credentials using email + password
    @PostMapping("/login")
    public String processLogin(@RequestParam("email") String email,
                               @RequestParam("password") String password,
                               HttpSession session,
                               RedirectAttributes ra) {

        Student student = studentDAO.authenticate(email.trim(), password.trim());

        if (student != null) {
            // Store student info in session
            session.setAttribute("studentId", student.getStudentId());
            session.setAttribute("studentName", student.getName());
            return "redirect:/courses";
        } else {
            ra.addFlashAttribute("error", "Invalid email or password. Please try again.");
            return "redirect:/login";
        }
    }

    // GET /logout - clear session and return to login
    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes ra) {
        session.invalidate();
        ra.addFlashAttribute("message", "You have been logged out successfully.");
        return "redirect:/login";
    }
}
