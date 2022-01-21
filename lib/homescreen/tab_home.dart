import 'package:flutter/material.dart';

import '../login_screen.dart';

class TabHome extends StatefulWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          _homeEventItem('New Event'),
          _homeEventItem('Trend Event'),
          _homeEventItem('Promo Event'),
        ],
      ),
    );
  }

  Widget _homeEventItem(String title){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
            const Text('See All', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
          ],
        ),
        Image.asset('assets/images/ancon_event.jpeg', fit: BoxFit.fill,
        height: 150, width: MediaQuery.of(context).size.width,),
        space()
      ],
    );
  }
}
