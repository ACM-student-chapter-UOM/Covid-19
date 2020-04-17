import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CRUDManager {
  final db = Firestore.instance;

  createData(String dbname, dynamic json) async {
    // add users and add detect bluetooth addresses
    debugPrint("Ready to add the document");
    DocumentReference ref = await db.collection(dbname).add(json);
    // return ref.documentID;
  }

  void readData(String dbname, String id) async {
    //use to read user data and get the met people
    DocumentSnapshot snapshot = await db.collection(dbname).document(id).get();
  }

  void updateData(DocumentSnapshot doc, String dbname, dynamic json) async {
    //use to update the uder mobile number
    await db.collection(dbname).document(doc.documentID).updateData(json);
  }

  void deleteData(DocumentSnapshot doc, String dbname) async {
    // use to delete the userdata after 14 days
    await db.collection(dbname).document(doc.documentID).delete();
  }
}
