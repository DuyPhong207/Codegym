package model;

public class Customer {
    private String name;
    private String dateOfBirth;
    private String address;
    private String avatarPath = "C:\\Users\\Admin\\Desktop\\Codegym\\Module 3\\ss10\\BaiTap1\\Show_List_Customer\\web\\img\\Avatar.jpg";
    public Customer() {
    }

    public Customer(String name, String avatarPath, String address, String dateOfBirth) {
        this.name = name;
        this.avatarPath = avatarPath;
        this.address = address;
        this.dateOfBirth = dateOfBirth;
    }

    public String getName() {
        return name;
    }

    public Customer(String name, String address, String dateOfBirth) {
        this.name = name;
        this.address = address;
        this.dateOfBirth = dateOfBirth;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatarPath() {
        return avatarPath;
    }

    public void setAvatarPath(String avatarPath) {
        this.avatarPath = avatarPath;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
}
