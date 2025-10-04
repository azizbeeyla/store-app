import 'package:store_app/data/model/user_model.dart';

sealed class UserEvent {}

final class LoadUser extends UserEvent {}

final class UpdateUser extends UserEvent {
  final UserModel user;

  UpdateUser(this.user);
}
