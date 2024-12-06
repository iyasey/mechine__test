import 'package:flutter/material.dart';
import 'package:mechine___test/core/theme/app_theme.dart';
import 'package:mechine___test/feature/categories/view/widgets/list_tile_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return Scaffold(
      backgroundColor: colors.text,
      appBar: AppBar(
        backgroundColor: colors.text,
        foregroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_rounded, size: spaces.space_100 * 3.6),
        ),
        title: Text("Settings", style: typography.h600),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 20,
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
                          "Malak Idrissi",
                          style: typography.h400,
                        ),
                        Text(
                          "Rabat, Morocco",
                          style: typography.code,
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 4.9,
                    ),
                    InkWell(
                      child: CircleAvatar(
                        backgroundColor: colors.secondary,
                        radius: MediaQuery.sizeOf(context).width / 16,
                        child: Icon(
                          Icons.edit,
                          color: colors.text,
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
                  "Hi! My name is Malak,I'm a community manager from Rabat, Morocco",
                  style: typography.h200.copyWith(color: colors.secondary),
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
