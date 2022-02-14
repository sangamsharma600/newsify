import 'package:flutter/material.dart';
import 'package:newsify/widgets/article_blog.dart';
import 'package:newsify/widgets/custom_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference news = FirebaseFirestore.instance.collection('news');
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        title: const CustomAppBar(),
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('news').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Loading...');
            default:
              return PageView.builder(
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, position) {
                    final document = snapshot.data?.docs[position];
                    return BlogTile(
                      author: document!["author"],
                      desc: document["body"],
                      imageUrl:
                          "https://upload.wikimedia.org/wikipedia/commons/7/77/Cosmic_Background_Imager.jpeg",
                      title: document['title'],
                    );
                  });
          }
        },
      ),
    );
  }
}
