import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  const RadioGroup({Key? key}) : super(key: key);

  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class RadioGroupWidget extends State {

  String radioButtonItem = 'ONE';
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text('Selected Radio Item = ' + radioButtonItem,
                style: const TextStyle(fontSize: 21))
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'ONE';
                  id = 1;
                });
              },
            ),
            const Text(
              'Male',
              style: TextStyle(fontSize: 17.0),
            ),

            Radio(
              value: 2,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'TWO';
                  id = 2;
                });
              },
            ),
            const Text(
              'Female',
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}