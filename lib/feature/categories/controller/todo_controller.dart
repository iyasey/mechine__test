import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechine___test/feature/categories/model/todo_model.dart';
import 'package:mechine___test/feature/categories/services/todo_services.dart';

class TodoController extends GetxController {
  final TodoServices _todoServices = TodoServices();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController taskController = TextEditingController();

  void clearFields() {
    titleController.clear();
    taskController.clear();
    super.onClose();
  }

  var todos = <TodoModel>[].obs;

  void fetchTodos(String userId) {
    _todoServices.getTodos(userId).listen((todoList) {
      todos.value = todoList;
    });
  }

  Future<void> addTodo(String userId, String title, String subtitle) async {
    try {
      final todo = TodoModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: title,
          createdAt: DateTime.now(),
          subtitle: subtitle);
      await _todoServices.addTodo(userId, todo);
    } catch (e) {
      Get.snackbar('Error', 'Failed to add todo: $e');
    }
  }
}
