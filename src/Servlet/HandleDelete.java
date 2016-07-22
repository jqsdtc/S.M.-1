package Servlet;

import JavaBean.CargoBean;
import JavaBean.IndentBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * @Author: michael
 * @Date: 16-7-22 上午5:18
 * @Project: S.M.
 * @Package: ${PACKAGE_NAME}
 */
@WebServlet(name = "HandleDelete")
public class HandleDelete extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        IndentBean indentBean = (IndentBean) request.getSession().getAttribute("indentBean");
        int i = Integer.parseInt(request.getParameter("No."));
        ArrayList<CargoBean> indentUnitList = indentBean.getIndentUnitBeanList();
        indentBean.setPriceAllCount(indentBean.getPriceAllCount() - indentUnitList.remove(i).getPrice());
        indentBean.setIndentUnitBeanList(indentUnitList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/shoppingCart.jsp");
        requestDispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
