package Model;

import java.sql.Date;

public class checkout {
    private int checkoutID;
    private int userID;
    private int productID;
    private int quantity;
    private int restaurantID;
    private long total;
    private Date createdDate;

    public checkout() {
    }

    public checkout(int checkoutID, int userID, int productID, int quantity, int restaurantID, long total, Date createdDate) {
        this.checkoutID = checkoutID;
        this.userID = userID;
        this.productID = productID;
        this.quantity = quantity;
        this.restaurantID = restaurantID;
        this.total = total;
        this.createdDate = createdDate;
    }

    public int getCheckoutID() {
        return checkoutID;
    }

    public void setCheckoutID(int checkoutID) {
        this.checkoutID = checkoutID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
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

    public int getRestaurantID() {
        return restaurantID;
    }

    public void setRestaurantID(int restaurantID) {
        this.restaurantID = restaurantID;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
}
