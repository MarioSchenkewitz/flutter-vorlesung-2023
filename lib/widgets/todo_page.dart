import 'package:flutter/material.dart';
import 'package:flutter_vorlesung/repository/todo_repository.dart';


class TodoPage extends StatelessWidget{
  final TodoRepository todoRepository = TodoRepository();
  TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: todoRepository.getTodos(), builder: (context, snapshot){
      if(!snapshot.hasData){
        return const Center(child: CircularProgressIndicator());
      }
    return const SizedBox.shrink();
    });
    
  }

}
