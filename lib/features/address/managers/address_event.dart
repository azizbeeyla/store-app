import 'package:store_app/data/model/address_model.dart';

sealed class AddressEvent {}

final class AddressListEvent extends AddressEvent{}
final class SelectAddressEvent extends AddressEvent {
  final int selectedId;
  SelectAddressEvent(this.selectedId);
}
final class NewAddressEvent extends AddressEvent{
  final AddressModel address;

  NewAddressEvent(this.address);
}