import 'dart:convert';

import 'package:evenia/profile/profile_detail.dart';
import 'package:evenia/utils/session.dart';
import 'package:flutter/material.dart';

import '../login_screen.dart';

class TabProfile extends StatefulWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  _TabProfileState createState() => _TabProfileState();
}

class _TabProfileState extends State<TabProfile> {
  String username = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: ListView(
        children:[
          Card(
            color: Colors.white.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text('Profile', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                  space(),
                  const Icon(Icons.person, size: 40,),
                  space(),
                  Text(username, style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal)),
                  space(),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const DetailProfile()
                    ));
                  }, child: Text('Edit Profile'))
                ]
              ),
            ),
          ),
          space(),
          space(),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(onPressed: (){}, child: Text('History')))
        ]
      ),
    );
  }

  @override
  void initState() {
    getStringValuesSF('data_user').then((value) {
      String _data = json.decode(value!);
      Map<String, dynamic> _response = jsonDecode(_data);
      setState(() {
        username = _response['username'];
      });
    });
    super.initState();
  }
}
