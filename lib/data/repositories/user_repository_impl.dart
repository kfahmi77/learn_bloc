import 'package:belajar_bloc/data/datasources/remote_data_source/user/remote_data_source_user.dart';
import 'package:belajar_bloc/domain/entities/user.dart';

import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
   final RemotedataSourceUser remotedataSourceUser;

  UserRepositoryImpl({required this.remotedataSourceUser});

  @override
Future<User> getUser() async {
   final userModel = await remotedataSourceUser.getUser();
   return userModel.toDomain();
}
}