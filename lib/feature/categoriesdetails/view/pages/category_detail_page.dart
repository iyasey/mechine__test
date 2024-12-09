import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechine___test/core/theme/app_theme.dart';
import 'package:mechine___test/feature/categoriesdetails/controller/detail_controller.dart';

class CategoryDetailPage extends StatelessWidget {
  final String userId;
  final String todoId;
  final String? taskName;
  final DetailController _detailController = Get.put(DetailController());
  CategoryDetailPage(
      {super.key,
      required this.userId,
      required this.todoId,
      required this.taskName});

  @override
  Widget build(BuildContext context) {
    _detailController.fetchDetails(userId, todoId);
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colors.primary,
          title: Text(
            taskName ?? 'Unknown user',
            style: typography.h600.copyWith(color: colors.text),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: colors.text,
                ))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: spaces.space_200),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 25,
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
                            backgroundColor: colors.primary,
                          ),
                        ),
                        title: Text(
                          detail.task,
                          style: typography.h300.copyWith(color: colors.text),
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
          backgroundColor: colors.primary,
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.text,
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
                                hintStyle: typography.h200.copyWith()),
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: colors.secondary,
                )),
          ),
        ));
  }
}
