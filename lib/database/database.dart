import 'package:evenia/homescreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('user');

class Database {
  static String? userUid;

  static Future<void> addItem({
    required int id,
    required String fullName,
    required String phoneNumber,
    required String email,
    required String password,
    required String gender,
    required String username,
    required String birthDate,
    List<Map<String, int>>? events,
  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "id": id,
      "full_name": fullName,
      "phone_number": phoneNumber,
      "email": email,
      "username": username,
      "gender": gender,
      "password": password,
      "birth_date": birthDate,
      "events": events
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("user item added to the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
    _mainCollection.doc(userUid).collection('items');

    return notesItemCollection.snapshots();
  }

  static Query<Map<String, dynamic>> loginItems(String username, String password) {
    Query<Map<String, dynamic>> notesItemCollection =
    _mainCollection.doc(userUid).collection('items').where('username', isEqualTo: username).where('password', isEqualTo: password);

    return notesItemCollection;
  }

  static Future<void> updateItem({
    required int id,
    required String fullName,
    required String phoneNumber,
    required String email,
    required String password,
    required String gender,
    required String username,
    required String birthDate,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "id": id,
      "full_name": fullName,
      "phone_number": phoneNumber,
      "email": email,
      "username": username,
      "gender": gender,
      "password": password,
      "birth_date": birthDate,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}