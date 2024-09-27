import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

class GravitationalForceDialog extends StatefulWidget {
  const GravitationalForceDialog({
    super.key,
  });

  @override
  State<GravitationalForceDialog> createState() => _GravitationalForceDialogState();
}

class _GravitationalForceDialogState extends State<GravitationalForceDialog> {
  
  Vector3 gravForce = Vector3.zero();
  double gravConst = 6.7e-11;
  double mass1 = 0;
  double mass2 = 0;
  Vector3 pos1 = Vector3.zero();
  Vector3 pos2 = Vector3.zero();
  Vector3 posChange = Vector3.zero();
  double posChangeMag = 0;
  Vector3 posUnitVec = Vector3.zero();



  void _calculateGravForce() {
    setState(() {
      posChange = pos2 - pos1;
      posChangeMag = posChange.length;
      posUnitVec = posChange.normalized();
      
      double temp = -gravConst * ((mass1 * mass2)/(posChangeMag * posChangeMag));

      gravForce = posUnitVec * temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle calcStyle = ElevatedButton.styleFrom( textStyle: const TextStyle(fontSize: 20),
    backgroundColor: Theme.of(context).colorScheme.inversePrimary);
    ButtonStyle cancelStyle = ElevatedButton.styleFrom( textStyle: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.secondary),
    backgroundColor: Theme.of(context).colorScheme.tertiaryFixed);
    return AlertDialog(
      scrollable: true,
      title: const Text('Gravitational Force in Vector Form'),
      content:
        Column(
          children: <Widget>[
            TextField( // Pos 1 x Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'pos1x ='),
              onChanged: (value) {
                setState(() {
                  pos1.x = double.parse(value);
                });
              }
            ),
            TextField( // Pos 1 y Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'pos1y ='),
              onChanged: (value) {
                setState(() {
                  pos1.y = double.parse(value);
                });
              }
            ),
            TextField( // Pos 1 z Input
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'pos1z ='),
              onChanged: (value) {
                setState(() {
                  pos1.z = double.parse(value);
                });
              }
            ),
            TextField( // Pos 2 x Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'pos2x ='),
              onChanged: (value) {
                setState(() {
                  pos2.x = double.parse(value);
                });
              }
            ),
            TextField( // pos 2 y Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'pos2y ='),
              onChanged: (value) {
                setState(() {
                  pos2.y = double.parse(value);
                });
              }
            ),
            TextField( // pos 2 z Input
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'pos2z ='),
              onChanged: (value) {
                setState(() {
                  pos2.z = double.parse(value);
                });
              }
            ),
            TextField( // Mass 1 Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Mass 1 ='),
              onChanged: (value) {
                setState(() {
                  mass1 = double.parse(value);
                });
              }
            ),
            TextField( // Mass 2 Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Mass 2 ='),
              onChanged: (value) {
                setState(() {
                  mass2 = double.parse(value);
                });
              }
            ),
            ElevatedButton(
              onPressed: _calculateGravForce,
              style: calcStyle,
              child: const Text('Calculate'),
            ),
            Text('Gravitational Force = $gravForce'),
          ]
        ),

        actions: <Widget> [
          ElevatedButton(
            style: cancelStyle,
            child: const Text('Close'),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            }
          )
        ]
    );
  }
}
