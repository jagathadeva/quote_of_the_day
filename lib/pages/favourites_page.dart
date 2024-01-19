import 'package:flutter/material.dart';
import 'package:quote_of_the_day/models/favourites.dart';

import '../components/quote_tile.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Favourites"),
        backgroundColor: Colors.amber.shade100,
      ),
      body:               Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
                  
                  
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      return QuoteTile(quote: favorites[index]);
                    }),
      ),
    );
  }
}