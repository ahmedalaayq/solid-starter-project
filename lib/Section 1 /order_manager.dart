library;
/// Data Validations
/// Calculate Total Price
/// Inventory Management
/// Database Operation
/// Payment Processing
/// Email Notification
/// Analytics Tracking
/// Warehouse Communication

class OrderManager {
  // OrderModel Data
  String customerName = '';
  String customerEmail = '';
  List<Map<String, dynamic>> items = [];
  double totalAmount = 0.0;

  bool createOrder(Map<String, dynamic> orderData) {
    // Order Validation
    if (orderData['customerName'] == null ||
        orderData['customerName'].isEmpty) {
      print('Error: Customer name is required');
      return false;
    }

    if (!orderData['customerEmail'].contains('@')) {
      print('Error: Invalid email format');
      return false;
    }

    // calculate Order Total Price
    double total = 0.0;
    for (var item in orderData['items']) {
      total += item['price'] * item['quantity'];

      if (item['quantity'] > 10) {
        total *= 0.9;
      }
      // validation order stock
      if (item['stock'] < item['quantity']) {
        print('Error: Insufficient stock for ${item['name']}');
        return false;
      }
      // open connection on database
      updateInventoryInDatabase(item['id'], item['stock'] - item['quantity']);
    }

    // payment method using creditCard
    if (orderData['paymentMethod'] == 'credit_card') {
      bool paymentSuccess = chargeCreditCard(
        orderData['cardNumber'],
        orderData['expiryDate'],
        orderData['cvv'],
        total,
      );
      if (!paymentSuccess) {
        print('Payment failed');
        return false;
      }
    }
    // payment method using paypal
    else if (orderData['paymentMethod'] == 'paypal') {
      bool paymentSuccess = chargePaypal(orderData['paypalEmail'], total);
      if (!paymentSuccess) {
        print('PayPal payment failed');
        return false;
      }
    }

    // save Order Database --> Order Repo
    saveOrderToDatabase(orderData);

    // Email Notification
    sendEmail(
      orderData['customerEmail'],
      'Order Confirmation',
      'Your order #${DateTime.now().millisecondsSinceEpoch} has been confirmed',
    );

    /// Analytics Tracking
    updateAnalytics('order_completed', total);

    // WareHouse Notify
    notifyWarehouse(orderData);

    return true;
  }

  bool chargeCreditCard(
    String cardNumber,
    String expiry,
    String cvv,
    double amount,
  ) {
    return true;
  }

  bool chargePaypal(String email, double amount) {
    return true;
  }

  /// Call Database
  void updateInventoryInDatabase(String itemId, int newStock) {
    /// Impl
  }

  void saveOrderToDatabase(Map<String, dynamic> orderData) {
    /// Impl
  }

  void sendEmail(String to, String subject, String body) {
    /// Impl
  }

  void updateAnalytics(String event, double value) {
    /// Impl
  }

  void notifyWarehouse(Map<String, dynamic> orderData) {
    /// Impl
  }
}
