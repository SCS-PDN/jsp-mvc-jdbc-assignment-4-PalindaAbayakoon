package com.university.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.logging.Logger;

public class ActivityLoggingInterceptor implements HandlerInterceptor {

    private static final Logger logger = Logger.getLogger(ActivityLoggingInterceptor.class.getName());

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        HttpSession session = request.getSession(false);
        String user = (session != null && session.getAttribute("studentName") != null)
                ? (String) session.getAttribute("studentName")
                : "anonymous";

        String uri = request.getRequestURI();
        String method = request.getMethod();

        // Log every login attempt
        if (uri.contains("/login") && "POST".equals(method)) {
            String email = request.getParameter("email");
            logger.info("[LOGIN ATTEMPT] email=" + email);
        }

        // Log every course registration
        if (uri.contains("/register") && "POST".equals(method)) {
            logger.info("[REGISTRATION] user=" + user + " uri=" + uri);
        }

        // Log all requests
        logger.info("[REQUEST] user=" + user + " | " + method + " " + uri);

        return true; // always allow request to proceed
    }
}
