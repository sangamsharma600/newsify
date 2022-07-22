import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.blue,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      // centerTitle: true,
      // foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      title: Image.asset(
        'images/NewsIfy.png',
        width: 130,
      ),
      elevation: 0,
      centerTitle: true,
    );
  }
}
