package Model;

import java.sql.Date;

public class checkout {
    private int userID;
    private int productID;
    private int quantity;

    public checkout() {
    }

    public checkout(int userID, int productID, int quantity) {
        this.userID = userID;
        this.productID = productID;
        this.quantity = quantity;
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
}

