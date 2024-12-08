import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mechine___test/core/theme/app_theme.dart';
import 'package:mechine___test/core/theme/color_palette.dart';
import 'package:mechine___test/feature/auth/controller/auth_controller.dart';
import 'package:mechine___test/feature/categories/controller/todo_controller.dart';
import 'package:mechine___test/feature/categories/view/pages/settings_page.dart';
import 'package:mechine___test/feature/categoriesdetails/controller/detail_controller.dart';
import 'package:mechine___test/feature/categoriesdetails/view/pages/category_detail_page.dart';

class CategoriesPage extends StatelessWidget {
  final authController = Get.find<AuthController>();

  final String userId;

  final TodoController todoController = Get.put(TodoController());
  final DetailController _detailController = Get.put(DetailController());

  CategoriesPage({
    Key? key,
    required this.userId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final colors = AppTheme.of(context).colors;

    void _showAddTodoDialog() {
      Get.dialog(
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: AlertDialog(
            backgroundColor: colors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            content: Container(
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(0),
              ),
              height: Get.height * 0.2,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TextField(
                  //   controller: todoController.titleController,
                  //   decoration: const InputDecoration(
                  //     hintText: 'Title',
                  //     border: InputBorder.none,
                  //   ),
                  // ),
                  TextField(
                    controller: todoController.titleController,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                      border: InputBorder.none,
                    ),
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  TextField(
                    controller: todoController.taskController,
                    decoration: const InputDecoration(
                      hintText: '0 task',
                      border: InputBorder.none,
                    ),
                    onSubmitted: (_) {
                      final title = todoController.titleController.text;
                      final subtitle = todoController.taskController.text;
                      todoController.addTodo(userId, title, subtitle);
                      todoController.titleController.clear();
                      todoController.taskController.clear();
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        barrierColor: Colors.black.withOpacity(0.5),
      );
    }

    final spaces = AppTheme.of(context).spaces;

    final typography = AppTheme.of(context).typography;

    todoController.fetchTodos(userId);

    return Scaffold(
      backgroundColor: colors.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Categories',
          style: TextStyle(color: colors.text),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(spaces.space_100),
          child: InkWell(
              onTap: () {
                final currentUser = authController.getCurrentUser();
                if (currentUser != null) {
                  final userName = currentUser.displayName ?? 'Guest';
                  Get.to(() => SettingsPage(userName: userName));
                } else {
                  Get.snackbar('Error', 'User not authenticated');
                }
              },
              child: CircleAvatar()),
        ),
        actions: [
          IconButton(
            onPressed: () {
              authController.logout();
            },
            icon: Icon(Icons.logout, color: colors.text),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(spaces.space_200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: colors.secondary,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(12),
              // ),

              child: Padding(
                padding: EdgeInsets.all(spaces.space_400),
                child: Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('"The memories is a shield and life helper."',
                            style:
                                typography.h200.copyWith(color: colors.text)),
                        Text(
                          'Tamim Al-Barghouti',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            Obx(() {
              final todos = todoController.todos;

              return Expanded(
                child: GridView.builder(
                  itemCount: todos.length + 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return InkWell(
                        onTap: () {
                          _showAddTodoDialog();
                        },
                        child: Card(
                          elevation: 5,
                          child: Container(
                              height: spaces.space_700,
                              width: spaces.space_700,
                              decoration:
                                  BoxDecoration(color: colors.secondary),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: colors.text,
                                  child: Icon(
                                    Icons.add,
                                    color: colors.primary,
                                  ),
                                ),
                              )),
                        ),
                      );
                    } else {
                      final todo = todos[index - 1];
                      final taskCount =
                          _detailController.taskLengths[todo.id] ?? 0;

                      return InkWell(
                        onTap: () {
                          final todoId = todo.id;
                          Get.to(CategoryDetailPage(
                            userId: userId,
                            todoId: todoId,
                            taskName: todo.title,
                          ));
                        },
                        child: Card(
                          elevation: 5,
                          child: Container(
                            height: spaces.space_700,
                            width: spaces.space_700,
                            decoration: BoxDecoration(color: colors.secondary),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: spaces.space_200,
                                  left: spaces.space_300),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.task,
                                    color: colors.text,
                                  ),
                                  Text(
                                    todo.title,
                                    style: typography.h800
                                        .copyWith(color: colors.text),
                                  ),
                                  Text(
                                    taskCount.toString(),
                                    style: TextStyle(color: colors.text),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: colors.textInverse,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
