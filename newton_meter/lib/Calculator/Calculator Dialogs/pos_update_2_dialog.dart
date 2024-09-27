import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

class PosUpdate2Dialog extends StatefulWidget {
  const PosUpdate2Dialog({
    super.key,
  });

  @override
  State<PosUpdate2Dialog> createState() => _PosUpdate2DialogState();
}

class _PosUpdate2DialogState extends State<PosUpdate2Dialog> {
  Vector3 rf = Vector3.zero();
  Vector3 ri = Vector3.zero();
  Vector3 vi = Vector3.zero();
  Vector3 f = Vector3.zero();
  double m = 0;
  double dt = 0;
  Vector3 accel = Vector3.zero();


  void _calculateMomentum() {
    setState(() {
      accel = Vector3(f.x/m, f.y/m, f.z/m);
      rf = accel/2*(dt*dt) + vi*dt + ri;
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
      title: const Text('Position Update with Constant Force'),
      content:
        Column(
          children: <Widget>[
            TextField( // Force X Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Fnet x ='),
              onChanged: (value) {
                setState(() {
                  f.x = double.parse(value);
                });
              }
            ),
            TextField( // Force Y Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Fnet y ='),
              onChanged: (value) {
                setState(() {
                  f.y = double.parse(value);
                });
              }
            ),
            TextField( // Force z Input
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Fnet z ='),
              onChanged: (value) {
                setState(() {
                  f.z = double.parse(value);
                });
              }
            ),
            TextField( // ri X Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'ri x ='),
              onChanged: (value) {
                setState(() {
                  ri.x = double.parse(value);
                });
              }
            ),
            TextField( // ri Y Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'ri y ='),
              onChanged: (value) {
                setState(() {
                  ri.y = double.parse(value);
                });
              }
            ),
            TextField( // ri z Input
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'ri z ='),
              onChanged: (value) {
                setState(() {
                  ri.z = double.parse(value);
                });
              }
            ),
            TextField( // Velocity x Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'vi x ='),
              onChanged: (value) {
                setState(() {
                  vi.x = double.parse(value);
                });
              }
            ),
            TextField( // Velocity Y Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'vi y ='),
              onChanged: (value) {
                setState(() {
                  vi.y = double.parse(value);
                });
              }
            ),
            TextField( // Velocity z Input
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'vi z ='),
              onChanged: (value) {
                setState(() {
                  vi.z = double.parse(value);
                });
              }
            ),
            TextField( // Time Input
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Time ='),
              onChanged: (value) {
                setState(() {
                  dt = double.parse(value);
                });
              }
            ),
            TextField( // Mass Input
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Mass ='),
              onChanged: (value) {
                setState(() {
                  m = double.parse(value);
                });
              }
            ),
            ElevatedButton(
              onPressed: _calculateMomentum,
              style: calcStyle,
              child: const Text('Calculate'),
            ),
            Text('Final Position = $rf'),
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
