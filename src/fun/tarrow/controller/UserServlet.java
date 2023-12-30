package fun.tarrow.controller;

import fun.tarrow.service.UserServiceImpl;
import fun.tarrow.entity.User;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/userManager")
public class UserServlet extends HttpServlet {
    private final UserServiceImpl userServiceImpl = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String method = request.getParameter("method");
        int id;
        String username;
        String password;
        String email;
        String telephone;
        String gender;
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
                username = request.getParameter("username");
                password = request.getParameter("password");
                email = request.getParameter("email");
                telephone = request.getParameter("telephone");
                gender = request.getParameter("gender");
                this.userServiceImpl.save(new User(username, password, email, telephone, gender));
                response.sendRedirect("/userManager?method=list");
                break;
            case "update":
                id = Integer.parseInt(request.getParameter("id"));
                username = request.getParameter("username");
                password = request.getParameter("password");
                email = request.getParameter("email");
                telephone = request.getParameter("telephone");
                gender = request.getParameter("gender");
                this.userServiceImpl.update(new User(id, username, password, email, telephone, gender));
                response.sendRedirect("/userManager?method=list");
                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                this.userServiceImpl.delete(id);
                response.sendRedirect("/userManager?method=list");
                break;
        }
    }
}
