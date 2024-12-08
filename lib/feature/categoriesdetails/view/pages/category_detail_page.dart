import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mechine___test/core/theme/app_theme.dart';
import 'package:mechine___test/feature/categoriesdetails/controller/detail_controller.dart';

class CategoryDetailPage extends StatelessWidget {
  final String userId;
  final String todoId;
  final DetailController _detailController = Get.put(DetailController());
  CategoryDetailPage({super.key, required this.userId, required this.todoId});

  @override
  Widget build(BuildContext context) {
    _detailController.fetchDetails(userId, todoId);
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return Scaffold(
        backgroundColor: colors.text,
        appBar: AppBar(
          backgroundColor: colors.text,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "",
              style: typography.h600,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: spaces.space_200),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 25,
              ),
              Padding(
                padding: EdgeInsets.only(right: spaces.space_400 * 9.7),
                child: Text(
                  "Today",
                  style: typography.h200.copyWith(color: colors.textSubtle),
                ),
              ),
              Obx(() {
                return Expanded(
                  child: ListView.builder(
                    itemCount: _detailController.detail.length,
                    itemBuilder: (context, index) {
                      final detail = _detailController.detail[index];
                      return ListTile(
                        leading: CircleAvatar(
                          radius: spaces.space_150,
                          backgroundColor:
                              const Color.fromARGB(255, 57, 210, 90),
                          child: CircleAvatar(
                            radius: spaces.space_125,
                            backgroundColor: colors.text,
                          ),
                        ),
                        title: Text(
                          detail.task,
                          style: typography.h300,
                        ),
                      );
                    },
                  ),
                );
              })
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.secondary,
            ),
            constraints: const BoxConstraints.expand(),
            child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: const RoundedRectangleBorder(),
                        content: SizedBox(
                          height: 17,
                          child: TextField(
                            onSubmitted: (_) {
                              final task =
                                  _detailController.taskController.text;
                              _detailController.addDetails(
                                  userId, todoId, task);
                              Get.back();
                            },
                            controller: _detailController.taskController,
                            cursorHeight: 13,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type your task...",
                                hintStyle: typography.h200
                                    .copyWith(color: colors.textSubtle)),
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          ),
        ));
  }
}
