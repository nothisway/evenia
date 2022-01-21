import 'dart:math';

import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
import 'package:evenia/utils/radio_group.dart';
import 'package:flutter/material.dart';

import 'database/database.dart';
import 'login_screen.dart';
import 'utils/date_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final _dayOfBirthTextController = TextEditingController();
  final _monthOfBirthTextController = TextEditingController();
  final _yearOfBirthTextController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String radioButtonItem = 'Male';
  int id = 1;
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evenia'),
        centerTitle: true,
      ),
      body: Card(
        child: ListView(
          children: [
            space(),
            const Center(child: Text('Sign Up', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
            space(),
            TextFormField(
              controller: _fullNameController,
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                labelText: 'Fullname',
                // labelStyle: TextStyle(color: Colors.firebaseYellow),
                hintText: 'Fullname',
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
                errorStyle: const TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.amber,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                ),
              ),
            ),
            space(),
            TextFormField(
              controller: _emailController,
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                labelText: 'Email',
                // labelStyle: TextStyle(color: Colors.firebaseYellow),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
                errorStyle: const TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.amber,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                ),
              ),
            ),
            space(),
            TextFormField(
              controller: _passwordController,
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                labelText: 'Password',
                // labelStyle: TextStyle(color: Colors.firebaseYellow),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
                errorStyle: const TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.amber,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                ),
              ),
            ),
            space(),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 24),
              child: Text(
                'Date of Birth',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 24),
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          controller: _dayOfBirthTextController,
                          enabled: false,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          decoration: new InputDecoration(
                            hintText: "DD",
                            hintStyle:
                            TextStyle(color: Colors.grey),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "/",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          controller: _monthOfBirthTextController,
                          enabled: false,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            hintText: "MM",
                            hintStyle:
                            TextStyle(color: Colors.grey),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "/",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          controller: _yearOfBirthTextController,
                          enabled: false,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            hintText: "YYYY",
                            hintStyle:
                            TextStyle(color: Colors.grey),
                          )),
                    ),
                  ],
                ),
                onTap: () {
                  nativeDatePicker(context, selectedDate).then((value) {
                    if (value != null ){
                      setState(() {
                        selectedDate = value;
                        _dayOfBirthTextController.text =
                            value.day.toString().padLeft(2, '0');
                        _monthOfBirthTextController.text =
                            value.month.toString().padLeft(2, '0');
                        _yearOfBirthTextController.text = value.year.toString();
                      });
                    }
                  });
                },
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.only(left: 20, right: 20, top: 0),
            //   child: Text(
            //     'Gender',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            //   ),
            // ),
            space(),
            TextFormField(
              controller: _phoneNumberController,
              cursorColor: Colors.blue,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Phone number',
                // labelStyle: TextStyle(color: Colors.firebaseYellow),
                hintText: 'Phone number',
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
                errorStyle: const TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.amber,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                ),
              ),
            ),
            space(),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Gender',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Radio(
                    value: 1,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Male';
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
                        radioButtonItem = 'Female';
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
            ),
            TextFormField(
              controller: _usernameController,
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                labelText: 'Username',
                // labelStyle: TextStyle(color: Colors.firebaseYellow),
                hintText: 'Username',
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
                errorStyle: const TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.amber,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                ),
              ),
            ),
            space(),
            _isProcessing ? Container(
                height: 25,
                width: 25,
                child: const CircularProgressIndicator()) : ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.orange,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () async {
                Random random = new Random();
                Database.userUid = '1234';
                setState(() {
                  _isProcessing = true;
                });

                await Database.addItem(
                    id: random.nextInt(100),
                    birthDate: '${_dayOfBirthTextController.text}-${_monthOfBirthTextController.text}-${_yearOfBirthTextController.text}',
                    email: _emailController.text,
                    phoneNumber: _phoneNumberController.text,
                    fullName: _fullNameController.text,
                    gender: radioButtonItem,
                    password: _passwordController.text,
                    username: _usernameController.text,
                    events: null
                );

                setState(() {
                  _isProcessing = false;
                });

                Navigator.of(context).pop();
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
