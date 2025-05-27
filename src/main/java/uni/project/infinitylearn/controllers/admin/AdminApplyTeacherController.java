package uni.project.infinitylearn.controllers.admin;

import uni.project.infinitylearn.dao.GuestDao;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

import uni.project.infinitylearn.models.TeacherApplication;

public class AdminApplyTeacherController extends HttpServlet {
    private GuestDao guestDao;

    @Override
    public void init() throws ServletException {
        guestDao = new GuestDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<TeacherApplication> applications = guestDao.getAllTeacherApplications();
        request.setAttribute("applications", applications);
        request.getRequestDispatcher("/views/admin/admin-apply-teacher.jsp").forward(request, response);
    }
}