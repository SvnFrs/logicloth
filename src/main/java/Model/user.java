package Model;

public class user {
    private int userID;
    private String userName;
    private String password;
    private String email;
    private String fullName;
    private String role;
    private boolean status;

    public user() {
    }

    public user(int userID, String userName, String password, String email, String fullName, String role, boolean status) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.fullName = fullName;
        this.role = role;
        this.status = status;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
