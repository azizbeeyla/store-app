sealed class OrderEvent {}

final class PlaceOrderEvent extends OrderEvent {
  final int addressId;
  final String paymentMethod;
  final int cardId;

  PlaceOrderEvent({
    required this.addressId,
    this.paymentMethod = "Card",
    required this.cardId,
  });
}

final class GetOrderEvent extends OrderEvent {}

final class ChangeStatusEvent extends OrderEvent {
  final int selectedIndex;

  ChangeStatusEvent(this.selectedIndex);
}
