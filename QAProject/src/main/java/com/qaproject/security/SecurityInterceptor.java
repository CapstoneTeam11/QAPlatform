package com.qaproject.security;

import com.qaproject.dao.UserDao;
import com.qaproject.entity.User;
import com.qaproject.util.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by khangtnse60992 on 7/20/2015.
 */
@Component
public class SecurityInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    UserDao userDao;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod method = (HandlerMethod) handler;
            if (method.getMethod().getName().equals("login") == false && method.getMethod().getName().equals("printWelcome")== false) {
                User userSession = (User) request.getSession().getAttribute("user");
                if (userSession != null) {
                    User user = userDao.find(userSession.getId());
                    if (user.getStatus() == 1) {
                        request.setAttribute("banned", "banned");
                        request.getRequestDispatcher("/WEB-INF/view/invalidLogin.jsp").forward(request, response);
                        request.getSession().invalidate();
                        return false;
                    }
                }
                return true;
            }
        }
        return true;
    }
}
