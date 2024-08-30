import 'package:flutter/material.dart';
import 'widgets/user_list_screen_body.dart';

class UsersListScreen extends StatelessWidget {
  const UsersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users List')),
      body: const UserListScreenBody(),
    );
  }
}
