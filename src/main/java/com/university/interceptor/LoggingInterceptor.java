package com.university.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.logging.Logger;

public class LoggingInterceptor implements HandlerInterceptor {

    private static final Logger logger = Logger.getLogger(LoggingInterceptor.class.getName());

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) {
        HttpSession session = request.getSession(false);
        String user = (session != null && session.getAttribute("studentName") != null)
                ? (String) session.getAttribute("studentName")
                : "anonymous";

        String uri = request.getRequestURI();
        String method = request.getMethod();

        // Log every login attempt
        if ("POST".equals(method) && uri.contains("/login")) {
            String email = request.getParameter("email");
            request.setAttribute("loginAttemptEmail", email);
            logger.info("[LOGIN ATTEMPT] email=" + email);
        }

        // Log every course registration
        if ("POST".equals(method) && uri.contains("/register/")) {
            logger.info("[REGISTRATION] user=" + user + " uri=" + uri);
        }

        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response,
                                Object handler,
                                Exception ex) {
        String uri = request.getRequestURI();
        String method = request.getMethod();

        // Log login result after controller processing
        if ("POST".equals(method) && uri.contains("/login")) {
            HttpSession session = request.getSession(false);
            boolean success = session != null && session.getAttribute("studentId") != null;
            Object email = request.getAttribute("loginAttemptEmail");
            logger.info("[LOGIN RESULT] email=" + (email != null ? email : "unknown")
                    + " status=" + (success ? "SUCCESS" : "FAILURE"));
        }
    }
}
