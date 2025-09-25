import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const String _call = '010-1234-5678';
  static const String _email = 'qwer1234@google.com';
  static const String _git = 'https://github.com/nohyam';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKOiPMuLEICK79m7MfH4xcvTOdXul6gNperw&s'),
              ),
              Text(
                'DongJu Noh',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Source Code Pro',
                  fontSize: 20.0,
                  color: Colors.teal.shade100,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    _call,
                    style: TextStyle(
                      fontFamily: 'Source Code Pro',
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade900,
                      fontSize: 20.0,
                    ),
                  ),
                  onTap: () {
                    _launch(Uri.parse('tel:$_call'), context);
                  },
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.teal,
                  ),
                  title: Text(
                    _email,
                    style: TextStyle(
                      fontFamily: 'Source Code Pro',
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade900,
                      fontSize: 20.0,
                    ),
                  ),
                  onTap: () {
                    _launch(Uri.parse('mailto:$_email'), context);
                  },
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.pets,
                    color: Colors.teal,
                  ),
                  title: Text(
                    _git,
                    style: TextStyle(
                      fontFamily: 'Source Code Pro',
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  onTap: () {
                    _launch(Uri.parse(_git), context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _launch(Uri uri, context) async {
  if (!await launchUrl(uri)) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Can't open this App"),
      ),
    );
  }
}
