import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(width: 30,),
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
