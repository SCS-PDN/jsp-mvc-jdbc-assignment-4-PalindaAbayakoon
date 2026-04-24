package com.university.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import javax.servlet.http.HttpSession;

@Controller
public class DashboardController {

    // Redirect root URL to /courses if logged in, else to /login
    @GetMapping("/")
    public String home(HttpSession session) {
        if (session.getAttribute("studentId") != null) {
            return "redirect:/courses";
        }
        return "redirect:/login";
    }
}
