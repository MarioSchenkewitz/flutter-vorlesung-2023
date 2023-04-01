import 'dart:convert';

import 'package:flutter_vorlesung/repository/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoRepository {
  Future<List<TodoModel>> getTodos() async {
    final response = await http.get(Uri.https('dummyjson.com', 'todos'));
    final body = jsonDecode(response.body) as Map<String, dynamic>;

    final result = <TodoModel>[];

    for (final Map<String, dynamic> todo in (body['todos']) as List<dynamic>){
      result.add(TodoModel(todo['id'], todo['todo'], todo['completed']));
    }
    return result;
  }
}