import 'package:belajar_bloc/data/datasources/remote_data_source/user/remote_data_source_user.dart';
import 'package:belajar_bloc/data/repositories/user_repository_impl.dart';
import 'package:get_it/get_it.dart';

import 'domain/repositories/user_repository.dart';


final getIt = GetIt.instance;

void setup() {
 getIt.registerLazySingleton(() => RemotedataSourceUser()); // Register RemoteDataSourceUser
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(remotedataSourceUser: getIt<RemotedataSourceUser>()));
}