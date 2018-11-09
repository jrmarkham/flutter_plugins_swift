import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plugins_swift/src/screens/im_gal.dart';
import 'package:url_launcher/url_launcher.dart';

class PluginUI extends StatefulWidget {
  @override
  _PluginUIState createState() => _PluginUIState();
}

class _PluginUIState extends State<PluginUI> {
  void loadGallery() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ImageGalleryUI()));
  }

  void urlLaunch() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  static const platform = const MethodChannel('com.channels/test');
  void channel() async {
    try {
      final String result = await platform.invokeMethod('test');
      print('results from post $result');
    } on PlatformException catch (e) {
      print("twitter share error '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          child: Text('Swift Channel'),
          onPressed: channel,
        ),
        RaisedButton(
          child: Text('URL Launcher'),
          onPressed: urlLaunch,
        ),
        RaisedButton(
          child: Text('Gallery'),
          onPressed: loadGallery,
        ),
      ],
    );
  }
}
