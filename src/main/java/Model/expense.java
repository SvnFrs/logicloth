package Model;

public class expense {
    private int restaurantID;
    private long totalExpense;

    public expense() {
    }

    public expense(int restaurantID, long totalExpense) {
        this.restaurantID = restaurantID;
        this.totalExpense = totalExpense;
    }

    public int getRestaurantID() {
        return restaurantID;
    }

    public void setRestaurantID(int restaurantID) {
        this.restaurantID = restaurantID;
    }

    public long getTotalExpense() {
        return totalExpense;
    }

    public void setTotalExpense(long totalExpense) {
        this.totalExpense = totalExpense;
    }
}
