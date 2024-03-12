package Model;

public class sale {
    private int saleID;
    private int restaurantID;
    private int orderID;
    private int productID;
    private int quantity;
    private double totalSale;
    private String saleDate;

    public sale() {
    }

    public sale(int saleID, int restaurantID, int orderID, int productID, int quantity, double totalSale, String saleDate) {
        this.saleID = saleID;
        this.restaurantID = restaurantID;
        this.orderID = orderID;
        this.productID = productID;
        this.quantity = quantity;
        this.totalSale = totalSale;
        this.saleDate = saleDate;
    }

    public int getSaleID() {
        return saleID;
    }

    public void setSaleID(int saleID) {
        this.saleID = saleID;
    }

    public int getRestaurantID() {
        return restaurantID;
    }

    public void setRestaurantID(int restaurantID) {
        this.restaurantID = restaurantID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalSale() {
        return totalSale;
    }

    public void setTotalSale(double totalSale) {
        this.totalSale = totalSale;
    }

    public String getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(String saleDate) {
        this.saleDate = saleDate;
    }
}
