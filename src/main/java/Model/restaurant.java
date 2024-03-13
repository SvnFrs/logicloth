package Model;

public class restaurant {
    private int restaurantID;
    private int sellerID;
    private String restaurantName;
    private String restaurantDescription;
    private String restaurantAddress;
    private String restaurantImage;

    private boolean status;

    public restaurant(int restaurantID, String restaurantName, String restaurantDescription, String restaurantAddress, String restaurantImage, boolean status) {
        this.restaurantID = restaurantID;
        this.restaurantName = restaurantName;
        this.restaurantDescription = restaurantDescription;
        this.restaurantAddress = restaurantAddress;
        this.restaurantImage = restaurantImage;
        this.status = status;
    }

    public restaurant(int restaurantID, int sellerID, String restaurantName, String restaurantDescription, String restaurantAddress, String restaurantImage, boolean status) {
        this.restaurantID = restaurantID;
        this.sellerID = sellerID;
        this.restaurantName = restaurantName;
        this.restaurantDescription = restaurantDescription;
        this.restaurantAddress = restaurantAddress;
        this.restaurantImage = restaurantImage;
        this.status = status;
    }

    public int getSellerID() {
        return sellerID;
    }

    public void setSellerID(int sellerID) {
        this.sellerID = sellerID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    public String getRestaurantImage() {
        return restaurantImage;
    }

    public void setRestaurantImage(String restaurantImage) {
        this.restaurantImage = restaurantImage;
    }

    public restaurant() {

    }

    public int getRestaurantID() {
        return restaurantID;
    }

    public void setRestaurantID(int restaurantID) {
        this.restaurantID = restaurantID;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public String getRestaurantDescription() {
        return restaurantDescription;
    }

    public void setRestaurantDescription(String restaurantDescription) {
        this.restaurantDescription = restaurantDescription;
    }

    public String getRestaurantAddress() {
        return restaurantAddress;
    }

    public void setRestaurantAddress(String restaurantAddress) {
        this.restaurantAddress = restaurantAddress;
    }
}
