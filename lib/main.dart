import 'package:android_flutter_storage_operations/sayfaA.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<void> veriKaydi() async {

    /// await ile oluşmasini bekler
    var sp = await SharedPreferences.getInstance();

    sp.setString("ad", "Ahmet");
    sp.setInt("yas", 20);
    sp.setDouble("boy", 1.75);
    sp.setBool("durum", false);

    var arkadaslar = <String>[];
    arkadaslar.add("Mustafa");
    arkadaslar.add("Ali");
    arkadaslar.add("Buse");
    arkadaslar.add("Ceylin");

    sp.setStringList("agalar", arkadaslar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Flutter Storage Operations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Geçiş Yap"),
              onPressed: (){

                veriKaydi();

                Navigator.push(context, MaterialPageRoute(builder: (context) => SayfaA()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
