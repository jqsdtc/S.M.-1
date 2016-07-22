package JavaBean;

import java.util.ArrayList;

/**
 * @Author: michael
 * @Date: 16-7-21 上午1:38
 * @Project: S.M.
 * @Package: JavaBean
 */
public class IndentBean {
    ArrayList<CargoBean> indentUnitBeanList = null;
    double priceAllCount;
    boolean empty;

    public double getPriceAllCount() {
        return priceAllCount;
    }

    public void setPriceAllCount(double priceAllCount) {
        this.priceAllCount = priceAllCount;
    }

    public ArrayList<CargoBean> getIndentUnitBeanList() {
        return indentUnitBeanList;
    }

    public void setIndentUnitBeanList(ArrayList<CargoBean> indentUnitBeanList) {
        this.indentUnitBeanList = indentUnitBeanList;
    }

    public boolean isEmpty() {
        return empty;
    }

    public void setEmpty(boolean empty) {
        this.empty = empty;
    }
}
