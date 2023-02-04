import 'package:covid_19/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/data_source.dart';
import 'package:url_launcher/url_launcher.dart';


class InfoPanel extends StatelessWidget {
  const InfoPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQpage()
            ));
  },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            color: primaryBlack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget> [
                Text('FAQS', style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold,
                ),),
                Icon(Icons.arrow_forward, color: Colors.white,),
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: (){
            launch('https://covid19responsefund.org/en/');
          },

          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            color: primaryBlack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget> [
                Text('DONATE', style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold,
                ),),
                Icon(Icons.arrow_forward, color: Colors.white,),
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: (){
            launch('https://www.who.int/westernpacific/emergencies/covid-19/information/mythbusters');
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            color: primaryBlack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget> [
                Text('MYTH BUSTERS', style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold,
                ),),
                Icon(Icons.arrow_forward, color: Colors.white,),
              ],
            ),
          ),
        ),


      ],
    );
  }
}
