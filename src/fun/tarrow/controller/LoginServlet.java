package fun.tarrow.controller;

import fun.tarrow.entity.Admin;
import fun.tarrow.service.LoginServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// 通过 @WebServlet 注解配置了一个 Servlet，这个 Servlet 的路径是 /loginManager
@WebServlet("/loginManager")
public class LoginServlet extends HttpServlet {
    // 创建一个 UserServiceImpl 对象，用于处理业务逻辑
    private LoginServiceImpl loginServiceImpl = new LoginServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 统一调用doPost方法
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String method = req.getParameter("method");
        switch (method){
            // 登录
            case "login":
                String username = req.getParameter("username");
                String password = req.getParameter("password");
                if (this.loginServiceImpl.login(new Admin(username,password))){
                    req.getSession().setAttribute("username",username);
                    resp.sendRedirect("index.jsp");
                }else {
                    req.setAttribute("msg","用户名或密码错误");
                    req.getRequestDispatcher("/login.jsp").forward(req,resp);
                }
                break;
            // 注销
            case "logout":
                req.getSession().invalidate();
                resp.sendRedirect("login.jsp");
                break;
        }
    }
}
