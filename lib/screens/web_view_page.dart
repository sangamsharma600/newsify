import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newsify/widgets/article_blog.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/custom_app_bar.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        // centerTitle: true,
        // foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: Image.asset('images/NewsIfy.png',width: 130,),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 18,
            child: WebView(
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onProgress: (int progress) {
                LinearProgressIndicator(
                  value: progress.toDouble(),
                );
              },
              initialUrl: urlLink,
            ),
          ),
        ],
      ),
    );
  }
}
