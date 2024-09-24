public class InventoryManager {

    private class Item {
        public String name;
        public Integer quantity;

        public Item(String name, Integer quantity) {
            this.name = name;
            this.quantity = quantity;
        }
    }

    private Map<String, Item> inventory = new Map<String, Item>();

    public void addItem(String itemName, Integer quantity) {
        if (itemName == null || quantity == null || quantity <= 0) {
            return ; // Handle null or invalid inputs gracefully
        }

        Item item = inventory.get(itemName);
        if (item == null) {
            item = new Item(itemName, quantity);
            inventory.put(itemName, item);
        } else {
            item.quantity += quantity;
        }
    }

    public void removeItem(String itemName, Integer quantity) {
        if (itemName == null || quantity == null || quantity <= 0) {
            return ; // Handle null or invalid inputs gracefully
        }

        Item item = inventory.get(itemName);
        if (item != null) {
            item.quantity -= quantity;
            if (item.quantity < 0) {
                item.quantity = 0;
            }
        }
    }

    public Integer getQuantity(String itemName) {
        if (itemName == null) {
            return null; // Handle null input gracefully
        }

        Item item = inventory.get(itemName);
        return item != null ? item.quantity : null;
    }
}