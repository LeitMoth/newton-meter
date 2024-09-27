import 'package:flutter/material.dart';

class textData extends StatefulWidget {
  const textData({Key? key}) : super(key: key);

  @override
  _textDataState createState() => _textDataState();


}
  

class _textDataState extends State<textData> {
  final nameController=TextEditingController();
  double avgVelo = 0.00;
  double netForce = 1.00;
  double avgMoment = 2.00;
  double time = 3.00;
  double posChange = 4.00;
  double vector3 = 5.00;
  double vector4 = 6.00;

  void _AverageVelocity() {
  avgVelo = 1.00; //math
  }

  void _NetForce() {
  netForce =  2.00; //math
  }

  void _AverageMomentum(){
    avgMoment = 3.00;
  }

  void _Time(){
    time = 4.00;
  }

  void _PositionChange(){
    posChange = 5.00;
  }

  void _Vector3(){
    vector3 = 6.00;
  }

  void _Vector4(){
    vector4 = 7.00;
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      body: Card(
          child: Column(
            children: [
            TextField(
              decoration: InputDecoration(labelText: 'Mass'),
              keyboardType: TextInputType.number,
            ),
            Text(
              'Average Velocity = $avgVelo'),
              Text(
              'Net Force = $netForce'),
              Text(
              'Average Momentum = $avgMoment'),
              Text(
              'Time = $time'),
              Text(
              'Position Change = $posChange'),
              Text(
              'Vector 3 = $vector3'),
              Text(
              'Vector 4 = $vector4'),
            ]
          )
        )
        
      )
    );
  }
}




//TextField to enter mass; average velocity (Vector); net Force (Vector); average momentum; time; position change (Vector), magnitudes for all the vectors.