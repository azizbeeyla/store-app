import 'package:store_app/data/model/payment_model/add_cart_model.dart';

sealed class CardEvent {}

final class CardListEvent extends CardEvent {}

final class CardAddEvent extends CardEvent {
  final AddCardModel data;
  CardAddEvent(this.data);
}

final class SelectCardEvent extends CardEvent {
  final int selectedId;
  SelectCardEvent(this.selectedId);
}
