import 'package:flutter/material.dart';
import 'package:mechine___test/core/theme/app_theme.dart';
import 'package:mechine___test/feature/categories/view/widgets/list_tile_widget.dart';

class SettingsPage extends StatelessWidget {
  final String userName;
  const SettingsPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return Scaffold(
      backgroundColor: colors.primary,
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: Text("Settings",
            style: typography.h600.copyWith(color: colors.text)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 21,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spaces.space_500),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 30,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.sizeOf(context).width / 12,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: typography.h400.copyWith(color: colors.text),
                        ),
                        Text(
                          "Rabat, Morocco",
                          style: typography.code.copyWith(color: colors.text),
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 4.9,
                    ),
                    InkWell(
                      child: CircleAvatar(
                        backgroundColor: colors.text,
                        radius: MediaQuery.sizeOf(context).width / 16,
                        child: Icon(
                          Icons.edit,
                          color: colors.primary,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 30,
                ),

                Text(
                  "Hi! My name is $userName,I'm a community manager from Rabat, Morocco",
                  style: typography.h200.copyWith(color: colors.text),
                ),
                SizedBox(
                  height: spaces.space_900,
                ),
                // icons part.
                const ListTileWidget(
                    text: "Notifications", icon: Icons.notifications),
                const ListTileWidget(text: "General", icon: Icons.settings),
                const ListTileWidget(text: "Account", icon: Icons.person),
                const ListTileWidget(text: "About", icon: Icons.info),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
