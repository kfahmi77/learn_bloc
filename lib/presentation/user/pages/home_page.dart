import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/repositories/user_repository.dart';
import '../../bloc/user/user_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Home Page'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onSubmitted: (value) {
                userBloc.add(LoadUser(value));
              },
              decoration: InputDecoration(
                hintText: 'Enter user ID',
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<UserBloc, UserState>(
              bloc: userBloc,
              builder: (context, state) {
                if (state is UserInitial) {
                  return const Center(child: Text('Please enter a user ID'));
                } else if (state is UserLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UserLoaded) {
                  return Center(
                      child: Column(
                    children: [
                      Text('Hello, ${state.user.name}!'),
                      Text('Your email is ${state.user.email}'),
                    ],
                  ));
                } else if (state is UserError) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
