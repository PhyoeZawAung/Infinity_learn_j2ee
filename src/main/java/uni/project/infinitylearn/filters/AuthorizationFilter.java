package uni.project.infinitylearn.filters;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;

import uni.project.infinitylearn.models.User;

@WebFilter("/*")
public class AuthorizationFilter implements Filter {

    private static final List<String> PROTECTED_PATHS = Arrays.asList("/admin", "/student", "/teacher", "/reviewer");

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String contextPath = req.getContextPath(); // e.g. /infinitylearn
        String path = req.getRequestURI().substring(contextPath.length()); // e.g. /admin/dashboard

        // Check only protected paths
        for (String prefix : PROTECTED_PATHS) {
            if (path.startsWith(prefix)) {
                HttpSession session = req.getSession(false);
                if (session == null) {
                    res.sendRedirect(contextPath + "/login.jsp"); // or sendError
                    return;
                }

                User user = (User) session.getAttribute("auth_user");
                if (user == null || !prefix.equalsIgnoreCase("/" + user.getRole())) {
                    res.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied");
                    return;
                }

                break; // path matched and passed check
            }
        }

        chain.doFilter(request, response); // allow through
    }

    @Override
    public void init(FilterConfig filterConfig) {}

    @Override
    public void destroy() {}
}
