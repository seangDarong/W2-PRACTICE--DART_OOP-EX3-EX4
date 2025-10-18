enum DeliveryType  {PICKUP, DELIVERY}

class Product {
    String name;
    double price;

    Product(this.name, this.price);
}

class OrderItem {
    Product product;
    int quantity;

    OrderItem(this.product, this.quantity);
}

class Order {
    DeliveryType deliverType;
    List <OrderItem> orderItem;

    Order(this.deliverType, this.orderItem);
}

class Address {
    String city;
    String street;
    int postalCode;

    Address(this.city, this.street, this.postalCode);
}

class Customer {
    String name;
    Address ?address;
    List<Order> orders = [];

    Customer ({ required this.name, this.address});

    void addOrder (Order order){
        orders.add(order);
    }
}
class Shop {
    String name;
    late List<Product> products= [];
    late List<Order> orders= [];

    Shop({required this.name});

    void addProduct (Product product) {
        products.add(product);
    }

    void addOrder (Order order){
        orders.add(order);
    }

    void displayAllProduct (){
        for (int i = 0; i < products.length ; i++ ){
            print("name:${products[i].name}, price:${products[i].price }\$");
        }
    }
}

void printOrder (Customer customer) {
  print("\n================ Customer name: ${customer.name} ================");
    for (int i = 0; i < customer.orders.length ; i ++){
            Order order = customer.orders[i];
            print("\tOrder ${i + 1} ,Type: ${order.deliverType}:");
    
            for (int j = 0; j< order.orderItem.length ; j++){
                OrderItem item = order.orderItem[j];
                print("\t${item.product.name} ${item.product.price} x ${item.quantity}");
            }
            double total = 0;
            for (int k = 0; k < order.orderItem.length; k++) {
                OrderItem item = order.orderItem[k];
                total += item.product.price * item.quantity ;
            }
            print("\t-------------------------------------------");
            print("\tTotal: $total\$\n");
        }
}


main () {
    Shop shop1 = Shop(name : "CADT SHOP");
    Product product1 = Product("laptop", 200);
    Product product2 = Product("mouse", 20);

    shop1.addProduct(product1);
    shop1.addProduct(product2);

    // shop1.displayAllProduct();

    Address address1 = Address("Phnom Penh", "598", 12100);
    Customer customer1 = Customer (name: "darong" ,address: address1);
    Customer customer2 = Customer (name: "gnorad", address:address1);
    print(customer1.name);

    
    OrderItem orderItem2 = OrderItem(product1,1);
    OrderItem orderItem3 = OrderItem(product2,2);
    Order order3 = Order(DeliveryType.DELIVERY, [orderItem3 , orderItem2]);
    Order order2 = Order(DeliveryType.DELIVERY, [orderItem2]);
    customer2.addOrder(order2);
    customer1.addOrder(order2);
    customer1.addOrder(order3);
    printOrder(customer1);
    printOrder(customer2);
    

}