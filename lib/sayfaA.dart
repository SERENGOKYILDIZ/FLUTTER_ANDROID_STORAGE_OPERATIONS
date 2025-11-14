import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SayfaA extends StatefulWidget {
  const SayfaA({super.key});

  @override
  State<SayfaA> createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {

  Future<void> veriOku() async {

    /// await ile oluşmasini bekler
    var sp = await SharedPreferences.getInstance();

    String ad = sp.getString("ad") ?? "İsimsiz";
    int yas = sp.getInt("yas") ?? 10;
    double boy = sp.getDouble("boy") ?? 1.50;
    bool durum = sp.getBool("durum") ?? false;

    var arkadaslar = sp.getStringList("agalar") ?? null;

    print("Ad         : ${ad}");
    print("Yaş        : ${yas}");
    print("Boy        : ${boy}");
    print("Durum      : ${durum}");

    for(var aga in arkadaslar!){
      print("Arkadaş  : ${aga}");
    }
  }

  Future<void> veriSil() async {

    /// await ile oluşmasini bekler
    var sp = await SharedPreferences.getInstance();

    sp.remove("ad");
    sp.remove("yas");
    sp.remove("boy");
    sp.remove("durum");
    sp.remove("arkadaslar");

    print("Veriler silindi !!!!!!!!");
  }

  @override
  void initState() {
    super.initState();

    veriOku();

    veriSil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Sayfa A"),
      ),
      body: Center(
      ),
    );
  }
}
