import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mechine___test/core/theme/app_theme.dart';
import 'package:mechine___test/core/theme/color_palette.dart';

class CategoriesPage extends StatefulWidget {
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    final spaces = AppTheme.of(context).spaces;
    final colors = AppTheme.of(context).colors;

    final typography = AppTheme.of(context).typography;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(spaces.space_200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.white,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(12),
              // ),

              child: Padding(
                padding: EdgeInsets.all(spaces.space_400),
                child: Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(
                      width: spaces.space_100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('"The memories is a shield and life helper."',
                            style: typography.h200
                                .copyWith(color: colors.secondary)),
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
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  //  final category = categories[index];
                  if (index == 0) {
                    return InkWell(
                      onTap: () {
                        _showAddTodoDialog();
                      },
                      child: Container(
                          height: spaces.space_700,
                          width: spaces.space_700,
                          decoration:
                              BoxDecoration(color: AppColorPalettes.white500),
                          child: Center(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: AppColorPalettes.black500,
                              child: Icon(
                                Icons.add,
                                color: AppColorPalettes.white500,
                              ),
                            ),
                          )),
                    );
                  } else {
                    return Container(
                      height: spaces.space_700,
                      width: spaces.space_700,
                      decoration:
                          BoxDecoration(color: AppColorPalettes.white500),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: spaces.space_200, left: spaces.space_300),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home),
                            Text(
                              "home",
                              style: typography.h800,
                            ),
                            Text("10 tasks"),
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
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddTodoDialog() {
    showDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (BuildContext context) {
          final _titleController = TextEditingController();
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: AlertDialog(
              content: Container(
                  height: ,
                  width: double.infinity,
                  child: TextField(
                    controller: _titleController,
                    decoration:
                        const InputDecoration(hintText: 'Enter Todo Title'),
                  )),
              // ,),
              // title: const Text('Add Todo'),
              // content: TextField(
              //   controller: _titleController,
              //  decoration: const InputDecoration(hintText: 'Enter Todo Title'),

              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    // Add the new todo to your list here
                    // ...
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          );
        });
  }
}
