/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author PC
 */
public class Account {

    private int userID;
    private String username;
    private String password;
    private int role;
    private String name;
    private String address;
    private String phone;

    public Account() {
    }
    

    
    
    public Account(int userID, String username, String password, int role, String Name, String Address, String Phone) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.role = role;
        this.name = Name;
        this.address = Address;
        this.phone = Phone;
    }

    public Account(int userID, String username, String password, int role) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public Account(String username, String password, int role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public Account(String username, String password) {
        this.username = username;
        this.password = password;
    }
// 
    
    //    "Select UserName, Password, Name, Address, Phone \n" +
//                            "from tbAccount a inner join tbUserInfor b \n" +
//                            "on a.UserID = b.UserID and a.UserName = ? ";
    public Account(String username, String password, String Name, String Address, String Phone) {
        this.username = username;
        this.password = password;
        this.name = Name;
        this.address = Address;
        this.phone = Phone;
    }

    public Account(int userID, String Name, String Address, String Phone, int role) {
        this.userID = userID;
        this.name = Name;
        this.address = Address;
        this.phone = Phone;
        this.role = role;
    }
    
    
    
    public String getName() {
        return name;
    }

    public void setName(String Name) {
        this.name = Name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String Address) {
        this.address = Address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String Phone) {
        this.phone = Phone;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Account{" + " username=" + username + ", password=" + password + ", role=" + role + '}';
    }

}