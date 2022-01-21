import 'dart:convert';

import 'package:evenia/register_screen.dart';
import 'package:evenia/utils/session.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'database/database.dart';
import 'homescreen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error initializing Firebase');
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  Image.asset('assets/images/logo_evenia.jpeg'),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    color: Colors.white.withOpacity(0.5),
                    borderOnForeground: true,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          space(),
                          const Center(child: Text('Sign In')),
                          space(),
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
                          TextFormField(
                            controller: _passwordController,
                            cursorColor: Colors.blue,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              // labelStyle: TextStyle(color: CustomColors.firebaseYellow),
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
                            padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                            child: Container(
                              width: double.maxFinite,
                              child: ElevatedButton(
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
                                onPressed: () {
                                  Database.userUid = '1234';

                                  Database.loginItems(_usernameController.text, _passwordController.text).get().then((value){
                                    if (value.docs.isNotEmpty){
                                      String data = json.encode(value.docs.first.data());
                                      print('data : ' + data.toString());
                                      save('docs_id', value.docs.first.id);
                                      save('data_user', json.encode(data));
                                      Navigator.pushReplacement(context, MaterialPageRoute(
                                          builder: (context) => const HomeScreen()
                                      ));
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Username atau password salah!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                    }
                                  });
                                  // widget.focusNode.unfocus();

                                  // if (_loginInFormKey.currentState!.validate()) {
                                  //   Database.userUid = _uidController.text;
                                  //
                                  //   Navigator.of(context).pushReplacement(
                                  //     MaterialPageRoute(
                                  //       builder: (context) => DashboardScreen(),
                                  //     ),
                                  //   );
                                  // }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                                  child: Text(
                                    'SIGN IN',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                            },
                            child: const Text('Register', style: TextStyle(color: Colors.blue),),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.red,
            ),
          );
        }
      },
    );
  }
}

Widget space() {
  return const SizedBox(
    height: 20,
  );
}
