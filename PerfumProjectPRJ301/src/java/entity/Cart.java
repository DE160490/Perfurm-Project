package entity;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }
        
    public Cart(String txt, List<Product> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                for (String i : s) {
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    updateList(id, quantity,list);
                }
            }
        } catch (Exception e) {
        }
    }

    private Product getProductById(int id, List<Product> list) {
        for (Product p : list) {
            if (p.getProductID() == id) {
                return p;
            }
        }
        return null;
    }

        private void updateList(int id, int quantity, List<Product> list) {
        for(Item i:items){
            if(i.getProduct().getProductID() == id){
                i.setQuantity(i.getQuantity()+quantity);
                return;
            }
        }
        items.add(new Item(getProductById(id, list), quantity));
    }
    
    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public Item getItemById(int id) {
        for (Item i : items) {
            if (i.getProduct().getProductID() == id) {
                return i;
            }
        }
        return null;
    }

    public void removeItemById(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public int getTotal() {
        int t = 0;
        for (Item i : items) {
            t += (i.getProduct().getSalePrice() * i.getQuantity());
        }
        return t;
    }
    
    public int getQuantityById(int id){
        return getItemById(id).getQuantity();
    }
    
    public void setQuantityById(int id, int x){
        getItemById(id).setQuantity(getItemById(id).getQuantity() + x);
    }
    
    public int getNumber() {
        int t = 0;
        for (Item i : items) {
            t += i.getQuantity();
        }
        return t;
    }
}