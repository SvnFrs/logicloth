package Model;

public class orderDetail {
    private int orderDetailID;
    private int orderID;
    private String receiverName;
    private String phoneNumber;
    private int productID;
    private int quantity;
    private long totalPrice;
    private String orderAddress;
    private boolean status;

    public orderDetail(int orderDetailID, int orderID, String receiverName, String phoneNumber, int productID, int quantity, long totalPrice, String orderAddress, boolean status) {
        this.orderDetailID = orderDetailID;
        this.orderID = orderID;
        this.receiverName = receiverName;
        this.phoneNumber = phoneNumber;
        this.productID = productID;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.orderAddress = orderAddress;
        this.status = status;
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

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
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

    public long getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(long totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
