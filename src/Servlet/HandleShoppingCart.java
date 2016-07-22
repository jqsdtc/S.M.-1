package Servlet;

import JavaBean.CargoBean;
import JavaBean.IndentBean;
import JavaBean.IndentUnitBean;
import JavaBean.InfoBean;

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
 * @Date: 16-7-21 上午1:33
 * @Project: S.M.
 * @Package: Servlet
 */
@WebServlet(name = "HandleShoppingCart")
public class HandleShoppingCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        CargoBean cargoBean = (CargoBean) request.getSession().getAttribute("cargoBean");
        IndentBean indentBean = (IndentBean) request.getSession().getAttribute("indentBean");
        int quantity = Integer.parseInt(request.getParameter("quantity").trim());
        ArrayList<CargoBean> indentUnitBeanList = null;
        double priceAllCount;
        if (indentBean == null || indentBean.getIndentUnitBeanList() == null) {
            indentBean = new IndentBean();
            request.getSession().setAttribute("indentBean", indentBean);
            indentUnitBeanList = new ArrayList<CargoBean>();
            priceAllCount = 0;
            indentBean.setEmpty(true);
        }
        else {
            indentUnitBeanList = indentBean.getIndentUnitBeanList();
            priceAllCount = indentBean.getPriceAllCount();
        }
        InfoBean infoBean = (InfoBean) request.getSession().getAttribute("infoBean");
        if (infoBean == null) {
            infoBean = new InfoBean();
            request.getSession().setAttribute("infoBean", infoBean);
        }
        String forward;
        if (cargoBean == null || cargoBean.getId() == 0) {
            infoBean.setInfo("");
        }
        else {
            cargoBean.setQuantity(quantity);
            indentUnitBeanList.add(cargoBean);
            priceAllCount += cargoBean.getPrice() * cargoBean.getQuantity();
            indentBean.setIndentUnitBeanList(indentUnitBeanList);
            indentBean.setPriceAllCount(priceAllCount);
            indentBean.setEmpty(false);
            infoBean.setInfo("");
        }
        forward = "/shoppingCart.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(forward);
        requestDispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
