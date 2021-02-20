import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

class dosyaislemleri extends StatefulWidget {
  @override
  _dosyaislemleriState createState() => _dosyaislemleriState();
}

class _dosyaislemleriState extends State<dosyaislemleri> {
  TextEditingController mycontroller = TextEditingController();

  //Olusturulacak klasorun yolu
  Future<String> get getKlasorYolu async {
    Directory klasor = await getApplicationDocumentsDirectory();

    debugPrint("Klasorun yolu :$klasor");

    return klasor.path;
  }

  //Dosya olustur

  Future<File> get dosyaOlustur async {
    var klasorunyolu = await getKlasorYolu;
   return File(klasorunyolu + "/olusandosya.txt");
  }

  //okuma işlemi

  Future<String> okunacakDosya() async {
    try {
      var myDosya = await dosyaOlustur;

      String dosyaicergi = myDosya.readAsStringSync();
      return dosyaicergi;
    } catch (exception) {
      debugPrint("HATA :$exception");
    }
  }

  //Dosya yazma

  Future<File> dosyayaYaz(String dosyaninMetni) async {
    var myDosya = await dosyaOlustur;

    return myDosya.writeAsString(dosyaninMetni);
  }

  var veri = "";
  var key=GlobalKey<ScaffoldState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: key,
        appBar: AppBar(
          title: Text("Dosya İşlemleri"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: mycontroller,
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText:
                        "Buraya yazılacak degerler dosya ya kaydedilir",
                        hintStyle: TextStyle(
                            letterSpacing: 2,
                            fontSize: 20,
                            color: Colors.orange,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        onPressed: _dosyaYaz,
                        color: Colors.green,
                        child: Text("Dosya'ya Yaz"),
                      ),
                      RaisedButton(
                        onPressed: _dosyaOku,
                        color: Colors.orange,
                        child: Text("Dosya'dan oku"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        child: Text("$veri"),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  void _dosyaYaz() {
    dosyayaYaz(mycontroller.text.toString()).then((value){
      setState(() {
      });
      key.currentState.showSnackBar(SnackBar(content: Text("Başarıyla kaydedildi")));
    });
  }

  void _dosyaOku() async {
    okunacakDosya().then((String deger) {
      setState(() {
        veri = deger;
        debugPrint("$veri");
      });
    });
  }
}
