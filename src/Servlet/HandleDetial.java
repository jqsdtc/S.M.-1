package Servlet;

import JavaBean.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: michael
 * @Date: 16-7-19 下午7:03
 * @Project: S.M.
 * @Package: Servlet
 */
@WebServlet(name = "HandleDetial")
public class HandleDetial extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        ShowListBean showListBean = (ShowListBean) request.getSession().getAttribute("showListBean");
        int id = Integer.parseInt(request.getParameter("ID").trim());
        String type = request.getParameter("type").trim();
        String forward = null;
        CargoBean cargoBean = null;
        IndentUnitBean indentUnitBean = null;
        AddressBean addressBean = null;
        InfoBean infoBean = (InfoBean) request.getSession().getAttribute("infoBean");
        if (infoBean == null) {
            infoBean = new InfoBean();
            request.getSession().setAttribute("infoBean", infoBean);
        }
        if (showListBean == null) {
            forward = "/errorPage.jsp";
            infoBean.setInfo("数据库访问错误，请重试。");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(forward);
            requestDispatcher.forward(request, response);
            return;
        }
        for (Object bean: showListBean.getBeanSet()) {
            if (type.equals("cargo") && ((CargoBean)bean).getId() == id) {
                cargoBean = (CargoBean)bean;
                request.getSession().setAttribute("cargoBean", cargoBean);
                forward = "/detial.jsp";
                break;
            }
            else if (type.equals("indent") && ((IndentUnitBean)bean).getId() == id) {
                indentUnitBean = (IndentUnitBean)bean;
                request.getSession().setAttribute("indentUnitBean", indentUnitBean);
                forward = "/indent.jsp";
                break;
            }
            else if (type.equals("addres") && ((AddressBean)bean).getId() == id) {
                addressBean = (AddressBean)bean;
                request.getSession().setAttribute("addressBean", addressBean);
                forward = "/address.jsp";
                break;
            }
        }
        if (cargoBean == null && indentUnitBean == null && addressBean ==null || forward == null) {
            forward = "/errorPage.jsp";
            forward = "/errorPage.jsp";
            if (type.equals("cargo"))
                infoBean.setInfo("商品不存在。");
            if (type.equals("address"))
                infoBean.setInfo("地址不存在。");
            else
                infoBean.setInfo("订单不存在。");
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(forward);
        requestDispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
