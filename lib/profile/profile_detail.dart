import 'dart:convert';
import 'dart:math';

import 'package:evenia/database/database.dart';
import 'package:evenia/utils/custom_form.dart';
import 'package:evenia/utils/session.dart';
import 'package:flutter/material.dart';

import '../login_screen.dart';

class DetailProfile extends StatefulWidget {
  const DetailProfile({Key? key}) : super(key: key);

  @override
  _DetailProfileState createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  Map<String, dynamic>? userData;

  String? docsId;

  @override
  void initState() {
    getStringValuesSF('data_user').then((value) {
      String _data = json.decode(value!);
      Map<String, dynamic> _response = jsonDecode(_data);
      setState(() {
        _fullnameController.text = _response['full_name'];
        _emailController.text = _response['email'];
        _passwordController.text = _response['password'];
        _phoneNumberController.text = _response['phone_number'];
        userData = _response;
      });
    });

    getStringValuesSF('docs_id').then((value) {
      setState(() {
        docsId = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evenia'),
      ),
      body: ListView(children: [
        space(),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: Card(
            color: Colors.white.withOpacity(0.5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                space(),
                const Text('Edit Profile',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                space(),
                customForm(_fullnameController, 'Full Name'),
                space(),
                customForm(_emailController, 'Email'),
                space(),
                customForm(_passwordController, 'Password', hidden: true),
                space(),
                customForm(_phoneNumberController, 'Phone Number'),
                space(),
                ElevatedButton(
                  onPressed: () async {
                    Random random = new Random();
                    // setState(() {
                    //   _isProcessing = true;
                    // });

                    await Database.updateItem(
                        id: userData!['id'],
                        birthDate: userData!['birth_date'],
                        email: _emailController.text,
                        phoneNumber: _phoneNumberController.text,
                        fullName: _fullnameController.text,
                        gender: userData!['gender'],
                        password: _passwordController.text,
                        username: userData!['username'],
                        docId: docsId!);

                    Database.loginItems(
                            userData!['username'], _passwordController.text)
                        .get()
                        .then((value) {
                      if (value.docs.isNotEmpty) {
                        String data = json.encode(value.docs.first.data());
                        print('data : ' + data.toString());
                        save('docs_id', value.docs.first.id);
                        save('data_user', json.encode(data));
                      }
                    });
                    // setState(() {
                    //   _isProcessing = false;
                    // });

                    Navigator.of(context).pop();
                  },
                  child: Text('Update'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                ),
                space(),
              ]),
            ),
          ),
        ),
        space(),
        Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: Text('Log Out'))),
      ]),
    );
  }
}
