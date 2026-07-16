import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_email_service.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_invoice_generator.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_model.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_repo.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_validator.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_tax_calculation.dart';

class OrderService {
  OrderService({
    required OrderValidator orderValidator,
    required OrderRepo orderRepo,
    required OrderEmailService orderEmailService,
    required OrderInvoiceGenerator orderInvoiceGenerator,
    required OrderTaxCalculator orderTaxCalculator,
  }) : _orderTaxCalculator = orderTaxCalculator,
       _orderValidator = orderValidator,
       _orderRepo = orderRepo,
       _orderEmailService = orderEmailService,
       _orderInvoiceGenerator = orderInvoiceGenerator;
  final OrderValidator _orderValidator;
  final OrderRepo _orderRepo;
  final OrderEmailService _orderEmailService;
  final OrderInvoiceGenerator _orderInvoiceGenerator;
  final OrderTaxCalculator _orderTaxCalculator;

  String createOrder(OrderModel order) {
    if (_orderValidator.isValidOrder(order)) {
      final tax = _orderTaxCalculator.calculateTax(order.total);
      _orderRepo.save(order);
      _orderEmailService.sendConfirmationEmail(order);
      _orderInvoiceGenerator.generateInvoice(order);
      final orderCreated =
          """Order Created Successfully
      Order($order), 
      """;
      return orderCreated;
    } else {
      return "Error While Created Order, insufficient order Items";
    }
  }
}
