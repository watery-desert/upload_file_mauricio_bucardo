import 'package:flutter/material.dart';

import 'social_banner.dart';
import 'upload_button/upload_button.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCE7C2),
      body: Center(
        child: Column(
          children: <Widget>[
            SocialBanner(),
            SizedBox(
              height: 200,
            ),
            UploadButton(),
          ],
        ),
      ),
    );
  }
}
