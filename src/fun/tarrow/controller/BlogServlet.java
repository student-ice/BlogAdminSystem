package fun.tarrow.controller;

import fun.tarrow.service.BlogServiceImpl;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 1. 通过 @WebServlet 注解配置了一个 Servlet，这个 Servlet 的路径是 /blogManager
@WebServlet("/blogManager")
public class BlogServlet extends HttpServlet {
    // 2. 创建一个 BlogServiceImpl 对象，用于处理业务逻辑
    private final BlogServiceImpl blogService = new BlogServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 统一调用doPost方法
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 设置编码,防止中文乱码
        request.setCharacterEncoding("UTF-8");
        // 3. 获取请求参数 method
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
