import 'package:flutter/material.dart';
import 'package:quotes/quotes.dart';

// Future<Quote> fetchAlbum() async {
//   final response =
//       Quotes.getRandom();

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Quote.fromJson(json.decode(response.body) as Map<String, dynamic>);
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('No Connection to Quotes Service');
//   }
// }

class Quote {
  final String quote;
  final String author;

  Quote({this.quote, this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
    final quote = json['result'];
    return Quote(
        quote: quote['quote'] as String, author: quote['author'] as String);
  }
}

void main() => runApp(const QuoteWidget());

class QuoteWidget extends StatefulWidget {
  const QuoteWidget({Key key}) : super(key: key);

  @override
  _QuoteWidgetState createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget> {
  Quote futureQuote;

  @override
  void initState() {
    super.initState();
    final quote = Quotes.getRandom();
    futureQuote = Quote(quote: quote.getContent(), author: quote.getAuthor());
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
          Column(
            children: <Widget>[
              Text(
                futureQuote.quote.toString(),
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Text(futureQuote.author.toString(),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400)),
            ],
          )
        ],
      ),
    );
  }
}
