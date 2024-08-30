import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkyou_task/features/home/data/models/user_model.dart';
import 'package:linkyou_task/features/home/data/repos/home_repository.dart';
import 'package:linkyou_task/features/home/presentation/views/manager/user_cubit.dart';
import 'package:linkyou_task/features/home/presentation/views/manager/user_state.dart';

class UsersListScreen extends StatelessWidget {
  const UsersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),
      body: BlocProvider(
        create: (context) => UsersCubit(HomeRepository()),
        child: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            if (state is UsersLoading && state is! UsersLoaded) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UsersError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is UsersLoaded) {
              return ListView.builder(
                itemCount: state.users.length + 1,
                itemBuilder: (context, index) {
                  if (index < state.users.length) {
                    return _buildUserTile(state.users[index]);
                  } else {
                    context.read<UsersCubit>().fetchUsers();
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              );
            } else {
              return const Center(child: Text('No users found.'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildUserTile(UserModel user) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatar),
      ),
    );
  }
}
