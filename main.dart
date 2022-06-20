import 'package:flutter/material.dart';
import 'package:kutuphane_otomasyon/firebase_options.dart';
import 'package:kutuphane_otomasyon/girisyap.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      home: gecis(),
    ),
  );
}

class gecis extends StatefulWidget {
  const gecis({Key? key}) : super(key: key);

  @override
  State<gecis> createState() => _gecisState();
}

class _gecisState extends State<gecis> {
  @override
  Widget build(BuildContext context) {
    return girisyapsayfasi();
  }
}
