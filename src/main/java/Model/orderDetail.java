package Model;

public class orderDetail {
    private int orderDetailID;
    private int orderID;
    private String receiverName;
    private int productID;
    private String orderAddress;
    private int quantity;
    private double price;

    public orderDetail(int orderDetailID, int orderID, String receiverName, int productID, String orderAddress, int quantity, double price) {
        this.orderDetailID = orderDetailID;
        this.orderID = orderID;
        this.receiverName = receiverName;
        this.productID = productID;
        this.orderAddress = orderAddress;
        this.quantity = quantity;
        this.price = price;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public orderDetail() {
    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
