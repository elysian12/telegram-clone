import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contactRepositoryProvider = Provider((ref) {
  return ContactRepository(
    firebaseFirestore: FirebaseFirestore.instance,
  );
});

class ContactRepository {
  final FirebaseFirestore firebaseFirestore;
  ContactRepository({
    required this.firebaseFirestore,
  });

  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(
          withProperties: true,
        );
      }
    } catch (e) {
      log(e.toString());
    }
    return contacts;
  }
}
