import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuteQuotes',
      theme: ThemeData(
        // Add the 5 lines from here...
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.pink,
        ),
      ),
      home: Quote(),
    );
  }
}

class Quote extends StatefulWidget {
  const Quote({Key? key}) : super(key: key);

  @override
  _Quote createState() => _Quote();
}

class _Quote extends State<Quote> {
  final Map<String, String> _suggestions = {
    'There is no snooze button on a cat who wants breakfast.': "Unknown",
    'Never try to outstubborn a cat.': "Robert A. Heinlein",
    'To err is human, to purr is feline.': "Robert Byrne"
  };

  Widget _buildSuggestions() {
    return ListView.builder(
        itemCount: _suggestions.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          String key = _suggestions.keys.elementAt(i);
          return new Column(
            children: <Widget>[
              new ListTile(
                title: new Text("$key"),
                subtitle: new Text("${_suggestions[key]}"),
              ),
              new Divider(
                height: 2.0,
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
}

//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: _getQuote(),
//         builder: (context, snapshot) {
//           return snapshot.connectionState == ConnectionState.done
//               ? Center(
//                   child: Text(
//                   snapshot.data as String,
//                   textAlign: TextAlign.center,
//                 ))
//               : Center(child: CircularProgressIndicator());
//         });
//   }
// }

// Future<Map<String, String>> _getQuote() async {
//   Map<String, String> map1 = {
//     'There is no snooze button on a cat who wants breakfast.': "Unknown",
//     'Never try to outstubborn a cat.': "Robert A. Heinlein",
//     'To err is human, to purr is feline.': "Robert Byrne"
//   };

//   // final res = await http.get(Uri.parse('http://quotes.rest/qod.json'));
//   return map1;
//   // final res = await http.get(Uri.parse('http://quotes.rest/qod.json'));
//   // return json.decode(res.body)['contents']['quotes'][0]['quote'];
// }
