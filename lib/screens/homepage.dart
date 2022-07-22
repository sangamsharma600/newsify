import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsify/screens/web_view_page.dart';
import 'package:newsify/widgets/article_blog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:newsify/widgets/my_drawer.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../functions/drag_detector.dart';

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
  Future<String> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return 'connected';
      }
    } on SocketException catch (_) {
      Alert(
          context: context,
          title: "Internet Connection Required",
          desc: "You need an valid internet connection to use this service.",
          closeIcon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          buttons: [
            DialogButton(
              child: Text(
                'OK',
                style: GoogleFonts.aBeeZee(color: Colors.black),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => const HomeScreen(),
                  ),
                );
              },
            ),
          ]).show();
    }
    return '';
  }

  CollectionReference news = FirebaseFirestore.instance.collection('news');
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    checkInternetConnection();
    return Scaffold(
      drawer: const MyDrawer(),
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
      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx < -5) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => const WebViewPage(),
              ),
            );
          }
        },
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore
              .collection('news')
              .orderBy('newsPostedDate', descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                    horizontalDrag(context);
                  },
                  child: PageView.builder(
                      controller: _controller,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, position) {
                        flutterTts.stop();
                        isSpeechPlaying = false;

                        // if (position != position) {
                        //
                        //   isSpeechPlaying = false;
                        //   flutterTts.stop();
                        // }
                        final document = snapshot.data?.docs[position];
                        return BlogTile(
                          author: document!["author"],
                          desc: document["body"],
                          imageUrl: document["image"],
                          title: document['title'],
                          url: document.data().toString().contains('url')
                              ? document.get('url')
                              : "https://www.npprice.com",
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
      ),
      appBar: AppBar(
        // centerTitle: true,
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
        backgroundColor: Colors.transparent,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("           "),
            Image.asset(
              'images/NewsIfy.png',
              width: 130,
            ),
          ],
        ),
        elevation: 0,
      ),
    );
  }
}

//test commit
