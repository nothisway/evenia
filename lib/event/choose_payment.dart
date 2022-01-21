import 'package:evenia/homescreen/home_screen.dart';
import 'package:flutter/material.dart';

import '../login_screen.dart';

class ChoosePayment extends StatefulWidget {
  const ChoosePayment({Key? key}) : super(key: key);

  @override
  _ChoosePaymentState createState() => _ChoosePaymentState();
}

class _ChoosePaymentState extends State<ChoosePayment> {
  int? _selectedIndex;

  final List<Map<String, String>> _listBank = [
    {'Bank BCA': 'assets/images/bca.png'},
    {'Bank BRI': 'assets/images/bri.png'},
    {'Bank Mandiri': 'assets/images/mandiri.png'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Evenia'), centerTitle: true),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: ListView(children: [
          const Text('Chose Payment Method',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          space(),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _listBank.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Card(
                    color: _selectedIndex == index ? Colors.grey : Colors.white,
                    child: ListTile(
                      title: Text(_listBank[index].keys.first),
                      trailing: Image.asset(_listBank[index].values.first, height: 30, width: 50),
                    ),
                  )
                );
              })
        ]),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 50),
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: const Text('Pay')),
      ),
    );
  }
}
