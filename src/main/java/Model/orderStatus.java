package Model;

public class orderStatus {
    private int orderStatusID;
    private String orderStatus;
    private String orderStatusRole;

    public orderStatus(int orderStatusID, String orderStatus, String orderStatusRole) {
        this.orderStatusID = orderStatusID;
        this.orderStatus = orderStatus;
        this.orderStatusRole = orderStatusRole;
    }

    public orderStatus() {
    }

    public int getOrderStatusID() {
        return orderStatusID;
    }

    public void setOrderStatusID(int orderStatusID) {
        this.orderStatusID = orderStatusID;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderStatusRole() {
        return orderStatusRole;
    }

    public void setOrderStatusRole(String orderStatusRole) {
        this.orderStatusRole = orderStatusRole;
    }
}
