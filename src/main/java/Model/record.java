package Model;

import java.sql.Date;

public class record {
    private int recordID;
    private int restaurantID;
    private Date recordDate;
    private int saleID;

    public record() {
    }

    public record(int recordID, int restaurantID, Date recordDate, int saleID) {
        this.recordID = recordID;
        this.restaurantID = restaurantID;
        this.recordDate = recordDate;
        this.saleID = saleID;
    }

    public int getRecordID() {
        return recordID;
    }

    public void setRecordID(int recordID) {
        this.recordID = recordID;
    }

    public int getRestaurantID() {
        return restaurantID;
    }

    public void setRestaurantID(int restaurantID) {
        this.restaurantID = restaurantID;
    }

    public Date getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(Date recordDate) {
        this.recordDate = recordDate;
    }

    public int getSaleID() {
        return saleID;
    }

    public void setSaleID(int saleID) {
        this.saleID = saleID;
    }
}
