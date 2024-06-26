import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/user_model.dart';

class RemotedataSourceUser {
  Future<UserModel> getUser(String id) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/$id'));
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}
