import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:quote_of_the_day/components/quote_tile.dart';
import 'package:quote_of_the_day/models/favourites.dart';
import 'package:quote_of_the_day/models/quote.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Quote> quotes = [];
  Quote quoteOfTheDay = Quote(q: "", a: "", c: "", h: "");

  getQuotes() async {
    if (loaded) {
      quoteOfTheDay = loadedQuotes[0];
      quotes = loadedQuotes.sublist(1);
    } else {
      final response =
          await http.get(Uri.parse('https://zenquotes.io/api/quotes'));

      setState(() {
        List<Quote> result = quoteFromJson(response.body);
        loadedQuotes = result;

        quoteOfTheDay = result[0];
        quotes = result.sublist(1);
      });
      loaded = true;
    }
  }

  @override
  void initState() {
    getQuotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.amber.shade100,
      ),
      body: 
      quotes.isEmpty?
      Center(
        child: CircularProgressIndicator(),
      ):
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Quote of the day",
                  style: TextStyle(
                      fontSize: 22, decoration: TextDecoration.underline),
                ),
              ),
              Visibility(child: QuoteTile(quote: quoteOfTheDay)),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Other quotes",
                  style: TextStyle(
                      fontSize: 22, decoration: TextDecoration.underline),
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: quotes.length,
                  itemBuilder: (context, index) {
                    return QuoteTile(quote: quotes[index]);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
