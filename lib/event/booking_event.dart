import 'package:evenia/utils/custom_form.dart';
import 'package:evenia/utils/date_picker.dart';
import 'package:flutter/material.dart';

import '../login_screen.dart';
import 'choose_payment.dart';

class BookingEvent extends StatefulWidget {
  const BookingEvent({Key? key}) : super(key: key);

  @override
  _BookingEventState createState() => _BookingEventState();
}

class _BookingEventState extends State<BookingEvent> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();

  final _dayOfBirthTextController = TextEditingController();
  final _monthOfBirthTextController = TextEditingController();
  final _yearOfBirthTextController = TextEditingController();

  final _durationController = TextEditingController();
  final _notesController = TextEditingController();

  DateTime selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evenia'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: ListView(
          children: [
            space(),
            const Text('Konser Iwan Fals'),
            space(),
            customForm(_nameController, 'Nama'),
            space(),
            customForm(_genderController, 'Gender'),
            space(),
            customForm(_phoneController, 'Phone'),
            space(),
            customForm(_occupationController, 'Occupation'),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 24),
              child: Text(
                'Start Date',
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
            space(),
            customForm(_notesController, "notes"),
            space(),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const ChoosePayment()
              ));
            }, child: const Text('Next')),
            space(),
          ]
        ),
      ),
    );
  }
}
