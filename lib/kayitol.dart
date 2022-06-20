import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kutuphane_otomasyon/girisyap.dart';
import 'package:kutuphane_otomasyon/kullanicianasayfa.dart';
import 'package:kutuphane_otomasyon/service/auth.dart';

class kayitolsayfasi extends StatefulWidget {
  const kayitolsayfasi({Key? key}) : super(key: key);

  @override
  State<kayitolsayfasi> createState() => _kayitolsayfasiState();
}

class _kayitolsayfasiState extends State<kayitolsayfasi> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  AuthService _authService = AuthService();
  Future<User?> createPerson(String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore
        .collection("kullanici")
        .doc(user.user!.uid)
        .set({'email': email});

    return user.user;
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final sifreController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                "Kayıt Ol",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 40,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "E-mail Adres",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.message,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 200,
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: "adsoyad@gmail.com",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Şifre",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 200,
                            child: TextField(
                              controller: sifreController,
                              decoration: InputDecoration(
                                hintText: "***********",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.visibility),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                fixedSize: Size(350, 65),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () async {
                await createPerson(emailController.text, sifreController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => girisyapsayfasi(),
                  ),
                );
              },
              child: Text(
                "Kayıt Ol",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 25,
                left: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => girisyapsayfasi(),
                        ),
                      );
                    },
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Text(
                    "Şifremi Unuttum",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
