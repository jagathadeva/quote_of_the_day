import 'package:flutter/material.dart';
import 'package:quote_of_the_day/models/favourites.dart';
import 'package:share_plus/share_plus.dart';

import '../models/quote.dart';

class QuoteTile extends StatelessWidget {
  final Quote quote;
  
  const QuoteTile({
    required this.quote,
  
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.amber.shade300

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(quote.q,style: TextStyle(fontSize: 20),),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [IconButton(onPressed: (){
                favorites.add(quote);
              }, icon: Icon(Icons.favorite)),
              SizedBox(width: 20,),
              IconButton(onPressed: (){
                Share.share("'${quote.q}' - ${quote.a}");
              }, icon: Icon(Icons.share)),],),
              Text("-${quote.a}",style: TextStyle(fontSize: 15),overflow: TextOverflow.fade,),
            ],
          ),
        ],
      ),
    );
  }
}