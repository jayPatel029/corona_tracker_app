import 'package:covid_19/data_source.dart';
import 'package:flutter/material.dart';

class FAQpage extends StatelessWidget {
  const FAQpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQs'),),
      body: ListView.builder(
          itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context,index){
        return ExpansionTile(
          title: Text(DataSource.questionAnswers[index]['question'],
          style: TextStyle(fontWeight: FontWeight.bold),),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(DataSource.questionAnswers[index]['answer']),
            ),
          ],
        );
      }),
    );
  }
}
