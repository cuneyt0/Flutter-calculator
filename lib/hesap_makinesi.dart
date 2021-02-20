import 'package:flutter/material.dart';
import 'dart:math';

class hesapMakinesi extends StatefulWidget {
  @override
  _hesapMakinesiState createState() => _hesapMakinesiState();
}

class _hesapMakinesiState extends State<hesapMakinesi> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  var sayi1;
  var sayi2;
  var sonuc;
  var metin = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Hesap Makinesi"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                //color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sonuç :",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      "$metin",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: controller1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "İlk sayi",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: controller2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "İkinci sayi",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: FlatButton(
                    color: Colors.teal,
                    onPressed: _temizle,
                    child: Text(
                      "Temizle",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                    color: Colors.green,
                    onPressed: _topla,
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 20),
                    )),
                FlatButton(
                    color: Colors.red,
                    onPressed: _cikar,
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 20),
                    )),
                FlatButton(
                    color: Colors.yellow,
                    onPressed: _carp,
                    child: Text(
                      "X",
                      style: TextStyle(fontSize: 20),
                    )),
                FlatButton(
                    color: Colors.purple,
                    onPressed: _bol,
                    child: Text(
                      "/",
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
            FlatButton(
                color: Colors.yellow,
                onPressed: _usal,
                child: Text(
                  "Üs hesapla",
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Center(
                child: Text(
                  "İleri Matematik hesaplama",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: controller3,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Deger",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                    color: Colors.orange,
                    onPressed: _kokal,
                    child: Text(
                      "\u221a",
                      style: TextStyle(fontSize: 20),
                    )),
                FlatButton(
                    color: Colors.greenAccent,
                    onPressed: _log,
                    child: Text(
                      "Log",
                      style: TextStyle(fontSize: 20),
                    )),
                FlatButton(
                    color: Colors.amberAccent,
                    onPressed: _ln2,
                    child: Text(
                      "Ln2",
                      style: TextStyle(fontSize: 20),
                    )),
                FlatButton(
                    color: Colors.pink,
                    onPressed: _faktoriyel,
                    child: Text(
                      "X!",
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                    color: Colors.redAccent,
                    onPressed: _cos,
                    child: Text(
                      "Cos",
                      style: TextStyle(fontSize: 20),
                    )),
                FlatButton(
                    color: Colors.blueAccent,
                    onPressed: _sin,
                    child: Text(
                      "Sin",
                      style: TextStyle(fontSize: 20),
                    )),
                FlatButton(
                    color: Colors.black38,
                    onPressed: _tan,
                    child: Text(
                      "Tan",
                      style: TextStyle(fontSize: 20),
                    )),
                FlatButton(
                    color: Colors.teal,
                    onPressed: _cot,
                    child: Text(
                      "Cot",
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _topla() {
    sayi1 = int.parse(controller1.text);
    sayi2 = int.parse(controller2.text);
    sonuc = sayi1 + sayi2;
    setState(() {
      metin = sonuc.toString();
    });
  }

  void _cikar() {
    sayi1 = int.parse(controller1.text);
    sayi2 = int.parse(controller2.text);
    sonuc = sayi1 - sayi2;
    setState(() {
      metin = sonuc.toString();
    });
  }

  void _carp() {
    sayi1 = int.parse(controller1.text);
    sayi2 = int.parse(controller2.text);
    sonuc = sayi1 * sayi2;
    setState(() {
      metin = sonuc.toString();
    });
  }

  void _bol() {
    sayi1 = int.parse(controller1.text);
    sayi2 = int.parse(controller2.text);
    if (sayi2 == 0) {
      sonuc = "Tanımsız";
    } else {
      sonuc = sayi1 / sayi2;
    }

    setState(() {
      metin = sonuc.toString();
    });
  }

  void _temizle() {
    controller1.text = "";
    controller2.text = "";
    controller3.text = "";
    sayi1 = 0;
    sayi2 = 0;
    sonuc = 0;
    setState(() {
      metin = sonuc.toString();
    });
  }

  void _usal() {
    sayi1 = int.parse(controller1.text);
    sayi2 = int.parse(controller2.text);
    sonuc = pow(sayi1, sayi2);
    setState(() {
      metin = sonuc.toString();
    });
  }

  void _kokal() {
    sayi1 = int.parse(controller3.text);
    sonuc = sqrt(sayi1);
    if (sayi1 > 0) {
      setState(() {
        metin = sonuc.toString();
      });
    }
  }

  //Bakılacak
  void _log() {
    sayi1 = double.parse(controller3.text);
    sonuc = log(sayi1).toStringAsFixed(8);
    setState(() {
      metin = sonuc.toString();
    });
  }

  void _ln2() {
    sayi1 = double.parse(controller3.text);
    sonuc = pow(ln2, sayi1).toStringAsFixed(8);
    setState(() {
      metin = sonuc.toString();
    });
  }

  void _cos() {
    sayi1 = double.parse(controller3.text);
    var derece = sayi1 * (pi / 180);
    sonuc = cos(derece).toStringAsFixed(3);
    setState(() {
      metin = sonuc.toString();
    });
  }

  void _sin() {
    sayi1 = double.parse(controller3.text);
    var derece = sayi1 * (pi / 180);
    sonuc = sin(derece).toStringAsFixed(1);
    setState(() {
      metin = sonuc.toString();
    });
  }

  void _tan() {
    sayi1 = double.parse(controller3.text);
    var derece = sayi1 * (pi / 180);
    sonuc = tan(derece).toStringAsFixed(5);
    setState(() {
      metin = sonuc.toString();
    });
  }

  void _cot() {
    sayi1 = double.parse(controller3.text);
    var derece = sayi1 * (pi / 180.0);
    sonuc = (1 / tan(derece)).toStringAsFixed(5);
    setState(() {
      metin = sonuc.toString();
    });
  }

  void _faktoriyel() {
    sayi1 = int.parse(controller3.text);
    var ilkdeger = 1;
    while (sayi1 >= 1) {
      ilkdeger = ilkdeger * sayi1;
      sayi1--;
    }
    sonuc = ilkdeger;
    setState(() {
      metin = sonuc.toString();
    });
  }
}
