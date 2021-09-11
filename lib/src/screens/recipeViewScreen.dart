import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class RecipeViewScreen extends StatefulWidget {
  // RecipeViewScreen({Key? key,String ? url}) : super(key: key);
  String url;
  RecipeViewScreen(this.url);
  @override
  _RecipeViewScreenState createState() => _RecipeViewScreenState();
}

class _RecipeViewScreenState extends State<RecipeViewScreen> {
  String finalUrl="";
  final Completer<WebViewController> controller = Completer<WebViewController>();
  @override
  void initState() { 
    if(widget.url.toString().contains("http://")){
      finalUrl = widget.url.toString().replaceAll("http://", "https://");
    }else{
      finalUrl = widget.url.toString();
    }
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foos Recipe App"),
      ),
      body: Container(
        child: WebView(
          initialUrl: finalUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController){
            setState(() {
              controller.complete(webViewController);
            });
          },
        ),
      ),
    );
  }
}