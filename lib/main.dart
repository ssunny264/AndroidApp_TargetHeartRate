import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Target Heart Rate Calculator'),
        ),
        body: HeartRate(),
      ),
    );
  }
}

class HeartRate extends StatefulWidget {
  const HeartRate({Key? key}) : super(key: key);

  @override
  _HeartRateState createState() => _HeartRateState();
}

class _HeartRateState extends State<HeartRate> {
  int _age = 0;
  int _maxRate = 0;
  double _targetRateMin = 0;
  double _targetRateMax = 0;

  _updateTargetRate() {
    setState(() {
      _maxRate = 220 - _age;
      _targetRateMin = _maxRate * .85;
      _targetRateMin = double.parse((_targetRateMin).toStringAsFixed(1));
      _targetRateMax = _maxRate * .5;
      _targetRateMax = double.parse((_targetRateMax).toStringAsFixed(1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: 350,
            child: TextField(
              autofocus: true,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Age',
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (val) => setState(() {
                _age = int.parse(val);
                _updateTargetRate();
              }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Center(
                    child: Text(
                      'Maximum Heart Rate: $_maxRate',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  flex: 1),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Target Heart Rate Minimum: $_targetRateMin',
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Target Heart Rate Maximum: $_targetRateMax',
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
