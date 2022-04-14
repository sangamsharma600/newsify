import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        // SizedBox(width: 20,),
        Text(
          'News',
          style: TextStyle(color: Colors.red,letterSpacing: 1.1,fontSize: 19,fontWeight: FontWeight.bold),
        ),
        Text(
          'Ify',
          style: TextStyle(color: Colors.blue,letterSpacing: 1.1,fontSize: 19,fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
