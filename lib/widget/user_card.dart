import 'package:flutter/material.dart';
import 'package:rest_user_api/screens/user_details.dart';

class UserCard extends StatelessWidget {

  final Map user;
  final int index;

  const UserCard(
      {Key? key,
        required this.index,
        required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user['profilePicture']),
        ),
        title: Text(user['name'], textScaleFactor: 1.2,),
        contentPadding: const EdgeInsets.all(8),
        subtitle: Text(user['email'], textScaleFactor: 1),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const UserDetails()));
        },
        trailing: Wrap(
          children: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}

