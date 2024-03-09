package Model;

public class order {
    private int orderID;
    private int userID;
    private int restaurantID;
    private String orderDate;
    private String orderStatus;
    private boolean status;

    public order(int orderID, int userID, int restaurantID, String orderDate, String orderStatus, boolean status) {
        this.orderID = orderID;
        this.userID = userID;
        this.restaurantID = restaurantID;
        this.orderDate = orderDate;
        this.orderStatus = orderStatus;
        this.status = status;
    }

    public order() {
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getRestaurantID() {
        return restaurantID;
    }

    public void setRestaurantID(int restaurantID) {
        this.restaurantID = restaurantID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }
}
