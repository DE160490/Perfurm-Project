/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author PC
 */
public class Product {

    private int productID;
    private String productName;
    private int purchasePrice;
    private int salePrice;
    private String image;
    private String description;
    private int cateID;
    private int quantity;
    private Date lastDayImport;

    public Product() {
    }

    public Product(int productID, String productName, int purchasePrice, int salePrice, String image, String description, int cateID, int quantity, Date lastDayImport) {
        this.productID = productID;
        this.productName = productName;
        this.purchasePrice = purchasePrice;
        this.salePrice = salePrice;
        this.image = image;
        this.description = description;
        this.cateID = cateID;
        this.quantity = quantity;
        this.lastDayImport = lastDayImport;
    }

    public Product(int productID, String productName, int salePrice, String image, int cateID) {
        this.productID = productID;
        this.productName = productName;
        this.salePrice = salePrice;
        this.image = image;
        this.cateID = cateID;
    }
    
    
    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getPurchasePrice() {
        return purchasePrice;
    }

    public void setPurchasePrice(int purchasePrice) {
        this.purchasePrice = purchasePrice;
    }

    public int getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(int salePrice) {
        this.salePrice = salePrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getLastDayImport() {
        return lastDayImport;
    }

    public void setLastDayImport(Date lastDayImport) {
        this.lastDayImport = lastDayImport;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", productName=" + productName + ", purchasePrice=" + purchasePrice + ", salePrice=" + salePrice + ", image=" + image + ", description=" + description + ", cateID=" + cateID + ", quantity=" + quantity + ", lastDayImport=" + lastDayImport + '}';
    }
}
