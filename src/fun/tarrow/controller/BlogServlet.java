package fun.tarrow.controller;

import fun.tarrow.service.BlogServiceImpl;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/blogManager")
public class BlogServlet extends HttpServlet {
    private final BlogServiceImpl blogService = new BlogServiceImpl();

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
                request.setAttribute("blogs", this.blogService.getAllBlogs());
                request.getRequestDispatcher("blog.jsp").forward(request, response);
                break;
            case "search":
                String key = request.getParameter("key");
                String keyword = request.getParameter("keyword");
                request.setAttribute("blogs", this.blogService.search(key, keyword));
                request.getRequestDispatcher("blog.jsp").forward(request, response);
                break;
            case "delete":
                int id = Integer.parseInt(request.getParameter("id"));
                this.blogService.delete(id);
                response.sendRedirect("/blogManager?method=list");
                break;
        }
    }
}
