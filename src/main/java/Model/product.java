package Model;

public class product {
    private int productID;
    private int restaurantID;
    private String productName;
    private String productDescription;
    private long productPrice;
    private String productImage;
    private int quantity;
    private boolean status;

    public product(int productID, int restaurantID, String productName, String productDescription, long productPrice, String productImage, int quantity, boolean status) {
        this.productID = productID;
        this.restaurantID = restaurantID;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productPrice = productPrice;
        this.productImage = productImage;
        this.quantity = quantity;
        this.status = status;
    }

    public product() {

    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getRestaurantID() {
        return restaurantID;
    }

    public void setRestaurantID(int restaurantID) {
        this.restaurantID = restaurantID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public long getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(long productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public int getProductQuantity() {
        return quantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.quantity = productQuantity;
    }
}
