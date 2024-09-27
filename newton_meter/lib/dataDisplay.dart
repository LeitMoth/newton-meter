import 'package:flutter/material.dart';

class textData extends StatefulWidget {
  const textData({Key? key}) : super(key: key);

  @override
  State<textData> createState() => _textDataState();
}
  

class _textDataState extends State<textData> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Card(
          child: Column(
            children: 
            TextField(
              decoration: InputDecoration(labelText: 'Mass'),
              keyboardType: TextInputType.number,
            )
          )
        )
      )
    )
  }
}

//TextField to enter mass; average velocity (Vector); net Force (Vector); average momentum; time; position change (Vector), magnitudes for all the vectors.