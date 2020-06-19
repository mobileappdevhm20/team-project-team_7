import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Quote> fetchAlbum() async {
  final response =
      await http.get('https://quotes.rest/qod?category=sports&language=en');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Quote.fromJson(json.decode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('No Connection to Quotes Service');
  }
}

class Quote {
  final String quote;
  final String author;
  final String date;

  Quote({this.quote, this.author, this.date});

  factory Quote.fromJson(Map<String, dynamic> json) {
    final results = json['contents'];
    final quote = results['quotes'][0];
    return Quote(
        quote: quote['quote'] as String,
        author: quote['author'] as String,
        date: quote['date'] as String);
  }
}

void main() => runApp(const QuoteWidget());

class QuoteWidget extends StatefulWidget {
  const QuoteWidget({Key key}) : super(key: key);

  @override
  _QuoteWidgetState createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget> {
  Future<Quote> futureQuote;

  @override
  void initState() {
    super.initState();
    futureQuote = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Quote of the Day",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Divider(
            thickness: 1.0,
            height: 1.0,
            color: Theme.of(context).primaryColor,
          ),
          const Padding(padding: EdgeInsets.all(5)),
          FutureBuilder<Quote>(
            future: futureQuote,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    Text(
                      snapshot.data.quote.toString(),
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.normal),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    Text(snapshot.data.author.toString(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400)),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}
