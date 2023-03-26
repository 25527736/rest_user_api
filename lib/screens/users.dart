import 'package:flutter/material.dart';
import 'package:rest_user_api/services/users_api_service.dart';
import 'package:rest_user_api/widget/user_card.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List _users = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users Page"),
      ),
      body: Visibility(
        visible: _isLoading,
        replacement: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, index) {
            final user = _users[index] as Map;
            return UserCard(index: index, user: user);
          },
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Future<void> fetchAllUsers() async {
    setState(() {
      _isLoading = true;
    });
    final users = await UsersService.fetchUsers();
    if (users != null) {
      setState(() {
        _users = users;
        _isLoading = false;
      });
    }
  }
}
