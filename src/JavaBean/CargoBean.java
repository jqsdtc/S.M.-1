package JavaBean;

/**
 * @Author: michael
 * @Date: 16-7-19 上午12:47
 * @Project: S.M.
 * @Package: JavaBean
 */
public class CargoBean {
    private int id;
    private String cargoname;
    private int inventory;
    private double price;
    private int sort;
    private int quantity;
    private String image;

    public static final short ID = 1;
    public static final short CARGONAME = 2;
    public static final short INVENTORY = 3;
    public static final short PRICE = 4;
    public static final short SORT = 5;
    public static final short IMAGE = 6;

    public static final short CLOTHES = 7;
    public static final short ORNAMENT = 8;
    public static final short TOY = 9;
    public static final short SHOE = 10;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCargoname() {
        return cargoname;
    }

    public void setCargoname(String cargoname) {
        this.cargoname = cargoname;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
