sealed class OrdersEvent {}

final class CreateOrdersEvent extends OrdersEvent {
  final int addressId;
  final int cardId;
  final String paymentMethod;

  CreateOrdersEvent({
    required this.addressId,
    required this.cardId,
     this.paymentMethod="Card",
  });
}
