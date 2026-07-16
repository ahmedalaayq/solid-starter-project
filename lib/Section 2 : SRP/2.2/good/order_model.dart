class OrderModel {
  OrderModel({required this.id, required this.total, required this.items});
  String id;
  double total;
  List<String> items;

  @override
  String toString() {
    return "OrderModel(id:$id, total:$total, items: $items)";
  }
}
