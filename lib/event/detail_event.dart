import 'package:evenia/event/booking_event.dart';
import 'package:flutter/material.dart';

import '../login_screen.dart';

class DetailEvent extends StatefulWidget {
  const DetailEvent({Key? key}) : super(key: key);

  @override
  _DetailEventState createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evenia'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/images/ancon_event.jpeg', fit: BoxFit.fill,),
          ),
          space(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Konser Iwan Fals', style: TextStyle(fontWeight: FontWeight.bold),),
                Text('15 Desember 2022', style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Rp 1.000.000', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
                    Text('Fasilitas Tempat Duduk', style: TextStyle(fontWeight: FontWeight.bold),),
                  ]
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const BookingEvent()
                    ));
                  },
                  child: Text('Booking'),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
