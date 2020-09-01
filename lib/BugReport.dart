import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class BugReport extends StatelessWidget {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.green, title: new Text('Bug Report')),
      body: WebView(
          initialUrl: 'https://docs.google.com/forms/d/e/1FAIpQLSfJbDSQvclKeffdPDPpQdif-LSRVGAWRGJNm0aiaa7bdZPWXg/viewform?usp=sf_link6',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controller) {
            _controller.complete(controller);
          }),
    );
  }
}
