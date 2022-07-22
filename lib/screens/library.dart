import 'package:flutter/material.dart';

class NewsLibrary extends StatelessWidget {
  const NewsLibrary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Library"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/newsify-4302f.appspot.com/o/news_images%2F1656762501038?alt=media&token=613ef430-bda7-4a62-99bd-964abbb6674a'),
            title: const Text(
              "This is a title of the News. Thank You !.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/newsify-4302f.appspot.com/o/news_images%2F1656762501038?alt=media&token=613ef430-bda7-4a62-99bd-964abbb6674a'),
            title: const Text(
              "This is a title of the News. Thank You !.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/newsify-4302f.appspot.com/o/news_images%2F1656762501038?alt=media&token=613ef430-bda7-4a62-99bd-964abbb6674a'),
            title: const Text(
              "This is a title of the News. Thank You !.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/newsify-4302f.appspot.com/o/news_images%2F1656762501038?alt=media&token=613ef430-bda7-4a62-99bd-964abbb6674a'),
            title: const Text(
              "This is a title of the News. Thank You !.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
