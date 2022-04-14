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
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.blue,
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    size: 32,
                  ),
                ),
                const CustomAppBar(),
                const Icon(
                  Icons.details,
                  color: Colors.transparent,
                ),
              ],
            ),
            flex: 1,
          ),
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
