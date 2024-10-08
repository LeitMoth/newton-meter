
import 'package:flutter/material.dart';
import 'package:newton_meter/Calculator/Calculator%20Dialogs/force_dialog.dart';
import 'package:newton_meter/Calculator/Calculator%20Dialogs/gravitational_force_dialog.dart';
import 'package:newton_meter/Calculator/Calculator%20Dialogs/magnitude_dialog.dart';
import 'package:newton_meter/Calculator/Calculator%20Dialogs/momentum_dialog.dart';
import 'package:newton_meter/Calculator/Calculator%20Dialogs/pos_update_2_dialog.dart';
import 'package:newton_meter/Calculator/Calculator%20Dialogs/pos_update_dialog.dart';
import 'package:newton_meter/Calculator/Calculator%20Dialogs/vavg_dialog.dart';

class CalculatorMain extends StatefulWidget {
  const CalculatorMain({super.key});

  @override
  State createState() => _CalculatorMainState();
}

class _CalculatorMainState extends State<CalculatorMain> {


  @override
  Widget build(BuildContext context) {
    ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20), backgroundColor: Theme.of(context).colorScheme.inversePrimary);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 30),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        key: Key('list'),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: <Widget> [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return const GravitationalForceDialog();
                }
              );
            },
            key: const Key('gfv'),
            style: style,
            child: const Text('Gravitational Force (Vector)'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return const ForceDialog();
                }
              );
            },
            key: const Key('fv'),
            style: style,
            child: const Text('Force (Vector)'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return const MomentumDialog();
                }
              );
            },
            key: const Key('mv'),
            style: style,
            child: const Text('Momentum (Vector)'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return const AvgVeloDialog();
                }
              );
            },
            key: const Key('avv'),
            style: style,
            child: const Text('Average Velocity (Vector)'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return const MagnitudeDialog();
                }
              );
            },
            key: const Key('mag'),
            style: style,
            child: const Text('Magnitude (Any Vector)'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return const PosUpdateDialog();
                }
              );
            },
            key: const Key('pu1'),
            style: style,
            child: const Text('Position Update (Vector - Using Pos, Time, and avg Velo)'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return const PosUpdate2Dialog();
                }
              );
            },
            key: const Key('pu2'),
            style: style,
            child: const Text('Position Update (Vector - Using Constant Force)'),
          ),
          // Add More Buttons for other formulas
        ]
      )
    );
  }
}