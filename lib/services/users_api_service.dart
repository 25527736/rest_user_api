import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_user_api/models/user_model.dart';

class UsersService {
  static final BASE_URL = 'https://restuser.vercel.app/api/users/';

  static Future<List?> fetchUsers() async {
    final uri = Uri.parse(BASE_URL);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map;

      final users = jsonData['data']['users'] as List;

      return users;
    }

    return null;
  }

  static Future<dynamic> fetchUserById(id) async {
    final uri = Uri.parse(BASE_URL + id);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;

      final userDetails = User.fromJson(jsonData['data']);

      return userDetails.user;
    }

    return null;
  }
}
