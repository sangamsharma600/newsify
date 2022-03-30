import 'dart:math';
import 'package:flutter/material.dart';
import 'package:newsify/widgets/article_blog.dart';
import 'package:newsify/widgets/custom_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tts/flutter_tts.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;
FlutterTts flutterTts = FlutterTts();
bool isSpeechPlaying = false;
bool isNewsScrolled = false;

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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        splashColor: Colors.white,
        onPressed: () async {
          isSpeechPlaying = !isSpeechPlaying;
          isSpeechPlaying
              ? await flutterTts.speak(description)
              : flutterTts.stop();
        },
        icon: const Icon(
          Icons.pause,
          color: Colors.red,
        ),
        label: const Icon(
          Icons.play_arrow,
          color: Colors.blue,
        ),
      ),
      appBar: AppBar(
        // foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: const CustomAppBar(),
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('news')
            .orderBy('newsPostedDate', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              return RefreshIndicator(
                color: Colors.redAccent,
                strokeWidth: 2,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                onRefresh: () async {
                  var randomDelay = Random();
                  await Future.delayed(
                    Duration(
                      seconds: randomDelay.nextInt(4),
                    ),
                  );
                  await Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                child: PageView.builder(
                    controller: _controller,
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, position) {
                      isSpeechPlaying = false;
                      flutterTts.stop();
                      final document = snapshot.data?.docs[position];
                      return BlogTile(
                        author: document!["author"],
                        desc: document["body"],
                        imageUrl: document["image"],
                        title: document['title'],
                        timestamp:
                            document.data().toString().contains('timestamp')
                                ? document.get('timestamp')
                                : "",
                      );
                    }),
              );
          }
        },
      ),
    );
  }
}
