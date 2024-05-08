import 'package:belajar_bloc/domain/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;
  UserBloc({required this.repository}) : super(UserInitial()) {
    on<LoadUser>((event, emit) async{
try {
      emit(UserLoading());
      final user = await repository.getUser();
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }});
  }
}
