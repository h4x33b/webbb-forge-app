import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../widgets/navigation_controls.dart';
import '../widgets/web_view_stack.dart';

class WebbbForgeHomePage extends StatefulWidget {
  const WebbbForgeHomePage({super.key});

  @override
  State<WebbbForgeHomePage> createState() => _WebbbForgeHomePageState();
}

class _WebbbForgeHomePageState extends State<WebbbForgeHomePage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {});
          },
          onPageFinished: (String url) {
            setState(() {});
          },
        ),
      )
      ..loadRequest(Uri.parse('https://webbbforge.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Webbb Forge'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              controller.loadRequest(Uri.parse('https://webbbforge.com'));
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controller.reload();
            },
          ),
        ],
      ),
      body: WebViewStack(controller: controller),
      bottomNavigationBar: NavigationControls(controller: controller),
    );
  }
}