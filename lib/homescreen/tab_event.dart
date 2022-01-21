import 'package:evenia/event/detail_event.dart';
import 'package:flutter/material.dart';

import '../login_screen.dart';

class TabEvent extends StatefulWidget {
  const TabEvent({Key? key}) : super(key: key);

  @override
  _TabEventState createState() => _TabEventState();
}

class _TabEventState extends State<TabEvent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        space(),
        const Text('Book Now', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
        space(),

        Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: 1
        ),
        ListTile(
          title: Text('Konser Iwan Fals'),
          trailing: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const DetailEvent()
              ));
            },
            child: Text('Book Now'),
          ),
        ),
        Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: 1
        ),
      ],
    );
  }
}
