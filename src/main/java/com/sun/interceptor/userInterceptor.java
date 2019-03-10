package com.sun.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class userInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("方法前");
        //判断用户是否登录 如果没有登录 重定向到登录界面 不放行 登录了就放行
        //URL 完整的请求地址
        //URI 部分请求地址
        String requestURI = request.getRequestURI();
        if (!requestURI.contains("/Login")) {
            String username = (String) request.getSession().getAttribute("username");
            if (null == username) {
                response.sendRedirect(request.getContextPath() + "/Login.net");
                return false;
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
