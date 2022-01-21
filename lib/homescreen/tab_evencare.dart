import 'package:flutter/material.dart';

import '../login_screen.dart';

class TabEvenCare extends StatelessWidget {
  const TabEvenCare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        space(),
        const Text('Customer Care', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        space(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.add_ic_call, size: 50,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Phone 1500-291(PSTN)'),
                const Text('Email Evencare@gmail.com'),
                space(),
                const Text('For Partner'),
                const Text('Phone 1500-291(PSTN)'),
                const Text('Email Evencare@gmail.com'),
              ],
            )
          ],
        )
      ],
    );
  }
}
