import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechine___test/core/theme/app_theme.dart';
import 'package:mechine___test/feature/auth/controller/auth_controller.dart';
import 'package:mechine___test/feature/categories/controller/todo_controller.dart';
import 'package:mechine___test/feature/categories/view/pages/settings_page.dart';
import 'package:mechine___test/feature/categoriesdetails/view/pages/category_detail_page.dart';

class CategoriesPage extends StatelessWidget {
  final authController = Get.find<AuthController>();

  final String userId;

  final TodoController todoController = Get.put(TodoController());

  CategoriesPage({
    super.key,
    required this.userId,
  });
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final colors = AppTheme.of(context).colors;

    void showAddTodoDialog() {
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
                  TextField(
                    controller: todoController.titleController,
                    decoration: const InputDecoration(
                      hintText: 'Title',
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
              child: const CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/f56188980615ee32fe42d4fd597b3ca3.jpg",
                ),
              )),
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
              elevation: 5,
              child: Container(
                width: double.infinity,
                height: height * 0.14,
                color: colors.secondary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/images/f56188980615ee32fe42d4fd597b3ca3.jpg"),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('"The memories is a shield and \n life  helper."',
                            style:
                                typography.h200.copyWith(color: colors.text)),
                        const Text(
                          'Tamim Al-Barghouti',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
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
                          showAddTodoDialog();
                        },
                        child: Card(
                          shape: const RoundedRectangleBorder(),
                          color: colors.secondary,
                          elevation: 5,
                          child: Center(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: colors.text,
                              child: Icon(
                                Icons.add,
                                color: colors.primary,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      final todo = todos[index - 1];

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
                          shape: const RoundedRectangleBorder(),
                          color: colors.secondary,
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.task,
                                  color: colors.text,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  todo.title,
                                  style: typography.h800
                                      .copyWith(color: colors.text),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: colors.textSubtle,
                                  ),
                                ),
                              )
                            ],
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
