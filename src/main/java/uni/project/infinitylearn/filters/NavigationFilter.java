package uni.project.infinitylearn.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NavigationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) {}
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String url = req.getRequestURI();
        String active = "";

        if(url.contains("/dashboard")){
            active = "dashboard";
        } else if(url.contains("/course")) {
            active = "course";
        // } else if(url.contains("/profile")) {
        //     active = "profile";
        // } else if(url.contains("/settings")) {
        //     active = "settings";
        // } else if(url.contains("/notifications")) {
        //     active = "notifications";
        } else if(url.contains("/chat")) {
            active = "chat";
        } 
        // else if(url.contains("/help")) {
        //     active = "help";
        // }

        req.setAttribute("active_nav", active);
        chain.doFilter(request, response);
    }
    @Override
    public void destroy() {}
}
