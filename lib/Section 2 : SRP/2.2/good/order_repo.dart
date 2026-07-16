import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_model.dart';

class OrderRepo {
  void save(OrderModel order) {
    print('Saving to database.... $order');
  }
}
