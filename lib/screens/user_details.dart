import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/users_api_service.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  bool _isLoading = false;
  UserClass? _user;

  @override
  void initState() {
    fetchUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit User'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: _isLoading,
              replacement: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(25),
                child: CircleAvatar(
                  radius: 65,
                  backgroundImage: NetworkImage(_user!.profilePicture),
                ),
              ),
              child: const Center(child: CircularProgressIndicator()),
            ),
            Text("Hey I'm ${_user!.name}",
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text("Email ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        Text(": ${_user!.email}",style: const TextStyle(fontSize: 18),),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Text("Contact ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        Text(": ${_user!.contactNumber}",style: const TextStyle(fontSize: 18),),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text("Date of Birth  ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        Text(": ${_user!.dob}",style: const TextStyle(fontSize: 18),),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text("Age ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        Text(": ${_user!.age}",style: const TextStyle(fontSize: 18),),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text("Address ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        Text(": ${_user!.address}",style: const TextStyle(fontSize: 18),),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text("Gender ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        Text(": ${_user!.gender}",style: const TextStyle(fontSize: 18),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchUserDetails() async {
    setState(() {
      _isLoading = true;
    });
    final user = await UsersService.fetchUserById("641c4746e45bbe8a2ebf81c8");
    debugPrint(user.id);
    if (user != null) {
      setState(() {
        _isLoading = false;
        _user = user;
      });
    }
  }
}
