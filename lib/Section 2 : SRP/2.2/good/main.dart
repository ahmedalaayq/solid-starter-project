import 'dart:math';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_email_service.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_invoice_generator.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_model.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_repo.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_service.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_tax_calculation.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_validator.dart';

void main() {
  OrderService orderService = OrderService(
    orderValidator: OrderValidator(),
    orderRepo: OrderRepo(),
    orderEmailService: OrderEmailService(),
    orderInvoiceGenerator: OrderInvoiceGenerator(),
    orderTaxCalculator: OrderTaxCalculator(),
  );
  final OrderModel order = OrderModel(
    id: generateRandomlyOrderId(),
    total: 150,
    items: ["Pizza"],
  );
  print(orderService.createOrder(order));
}

String generateRandomlyOrderId() {
  String chars = "ABCDEFGHJKMNPQRSTUVWXYZ23456789";
  final Random random = Random.secure();
  String value = '';
  for (int i = 0; i < 6; i++) {
    value += chars[random.nextInt(chars.length)];
  }
  return value;
}
