package fun.tarrow.controller;

import fun.tarrow.service.UserServiceImpl;
import fun.tarrow.entity.User;

import java.io.*;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/userManager")
public class UserServlet extends HttpServlet {
    private UserServiceImpl userServiceImpl = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String method = request.getParameter("method");
        switch (method) {
            case "list":
                request.setAttribute("users", this.userServiceImpl.getAllUsers());
                request.getRequestDispatcher("admin.jsp").forward(request, response);
                break;
            case "search":
                String key = request.getParameter("key");
                String keyword = request.getParameter("keyword");
                request.setAttribute("users", this.userServiceImpl.search(key, keyword));
                request.getRequestDispatcher("admin.jsp").forward(request, response);
                break;
            case "save":
                Integer id = Integer.valueOf(request.getParameter("id"));
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                String telephone = request.getParameter("telephone");
                String gender = request.getParameter("gender");
                this.userServiceImpl.save(new User(id, username, password, email, telephone, gender));
                response.sendRedirect("/userManager?method=list");
                break;
        }
    }
}
