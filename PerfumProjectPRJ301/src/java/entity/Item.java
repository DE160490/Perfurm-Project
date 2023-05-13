package entity;

public class Item {
    private Product product;
    private int Quantity;

    public Item() {
    }

    public Item(Product product, int Quantity) {
        this.product = product;
        this.Quantity = Quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }
    
    
}