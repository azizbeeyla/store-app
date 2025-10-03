sealed class AddressEvent {}

final class AddressListEvent extends AddressEvent{}
final class SelectAddressEvent extends AddressEvent {
  final int selectedId;
  SelectAddressEvent(this.selectedId);
}