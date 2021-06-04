import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Elijah\'s projects overview'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: IconButton(
                onPressed: () {
                  _launchInWebViewOrVC('https://vk.com/mr_gichebs');
                },
                icon: ImageIcon(AssetImage('icons/vk.png'))),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200),
            child: IconButton(
                onPressed: () {
                  _launchInWebViewOrVC('https://github.com/elijah-gichev');
                },
                icon: ImageIcon(AssetImage('icons/github.png'))),
          ),
        ],
        toolbarHeight: 40,
        backgroundColor: Colors.black54,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            ProjectCard(
              'GoodBuy',
              BoxDecoration(
                color: Colors.amber[700],
              ),
            ),
            ProjectCard(
              'Super snake',
              BoxDecoration(
                color: Colors.amber[500],
              ),
            ),
            ProjectCard(
              'New project',
              BoxDecoration(
                color: Colors.amber[100],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final BoxDecoration dec;

  const ProjectCard(this.title, this.dec);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: dec,
      width: 1000,
      child: Center(child: Text(title)),
    );
  }
}
