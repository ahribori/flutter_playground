import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';

class User with ChangeNotifier {
  List<dynamic> _users = [];

  List<dynamic> getUsers() {
    return _users != null ? _users : [];
  }

  void fetchUsers() async {
    var response = await get('https://jsonplaceholder.typicode.com/users');
    _users = jsonDecode(response.body);
    print(_users);
    notifyListeners();
  }
}
