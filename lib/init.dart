import 'package:belajar_bloc/data/datasources/remote_data_source/user/remote_data_source_user.dart';
import 'package:belajar_bloc/data/repositories/user_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'domain/repositories/user_repository.dart';
import 'domain/usecases/get_user.dart';
import 'presentation/bloc/user/user_bloc.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => RemotedataSourceUser());
  getIt.registerLazySingleton<UserRepository>(() =>
      UserRepositoryImpl(remotedataSourceUser: getIt<RemotedataSourceUser>()));
  getIt.registerLazySingleton<GetUser>(() => GetUser(getIt<UserRepository>()));
}

List<BlocProvider> createBlocProviders() {
  return [
    BlocProvider<UserBloc>(
      create: (context) => UserBloc(getUser: GetIt.I<GetUser>()),
    ),
    // Add more BlocProviders here
  ];
}
