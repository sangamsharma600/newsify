import 'package:flutter/material.dart';
import 'package:newsify/widgets/article_blog.dart';
import 'package:newsify/widgets/custom_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tts/flutter_tts.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;
FlutterTts flutterTts = FlutterTts();
bool isSpeechPlaying = false;

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
        label: const Icon(
          Icons.pause,
          color: Colors.blue,
        ),
        icon: const Icon(Icons.play_arrow, color: Colors.blue),
      ),
      appBar: AppBar(
        // foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        actions:const [
          Padding(
            padding:  EdgeInsets.only(right: 10.0),
            child:  Icon(
              Icons.account_circle,
              size: 29,
              color: Colors.blue,
            ),
          ),
        ],
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
                  });
          }
        },
      ),
    );
  }
}
