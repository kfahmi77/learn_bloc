part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {
  final String username;

  const LoadUser(this.username);

  @override
  List<Object> get props => [username];
}
