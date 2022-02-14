import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'News',
          style: TextStyle(color: Colors.red),
        ),
        Text(
          'Ify',
          style: TextStyle(color: Colors.blue),
        )
      ],
    );
  }
}
