package Servlet;

import JavaBean.InfoBean;
import JavaBean.UserBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: michael
 * @Date: 16-7-22 上午6:28
 * @Project: S.M.
 * @Package: ${PACKAGE_NAME}
 */
@WebServlet(name = "HandleLogout")
public class HandleLogout extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String forward;
        UserBean userBean = (UserBean)request.getSession().getAttribute("userBean");
        InfoBean infoBean = new InfoBean();
        boolean loginFlag = true;
        if(userBean == null) {
            infoBean.setInfo("您还未登录");
            loginFlag = false;
            forward = "login.jsp";
            userBean.setState(false);
        }
        else {
            request.getSession().invalidate();
            forward = "index.jsp";
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(forward);
        requestDispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
