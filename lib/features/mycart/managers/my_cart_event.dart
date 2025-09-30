abstract class MyCartEvent {}

class LoadCart extends MyCartEvent {}

class AddToCart extends MyCartEvent {
  final int productId;
  final int sizeId;

  AddToCart({
    required this.productId,
    required this.sizeId,
  });
}

class RemoveFromCart extends MyCartEvent {
  final int id;
  RemoveFromCart(this.id);
}
