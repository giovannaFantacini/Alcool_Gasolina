import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Número invalido, digite números maiores do que 0 e utilize (.).";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com álcool";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset("images/logo.png",
                  alignment: Alignment.topCenter),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual a melhor opção para o abastecimento do seu carro",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Preço Álcool, ex: 1.59',
              ),
              style: TextStyle(fontSize: 22, color: Colors.black),
              controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Preço Gasolina, ex: 3.15',
              ),
              style: TextStyle(fontSize: 22, color: Colors.black),
              controller: _controllerGasolina,
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () => _calcular(),
                  child: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(15.0))),
                )),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                _textoResultado,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      )),
    );
  }
}
