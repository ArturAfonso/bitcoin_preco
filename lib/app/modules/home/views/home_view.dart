import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    int umbtc = 1;
    TextEditingController _btcController =
        TextEditingController(text: 1.toString());
    return Scaffold(
      /* appBar: AppBar(
        title: Text('Preço do Bitcoin'),
        centerTitle: true,
      ), */
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
            child: Image.asset('imagens/logobtc.png'),
          ),
          /* Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Text("BTC ₿"),
              ),
              SizedBox(
                width: 80,
                child: TextFormField(
                  controller: _btcController,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      // hintText: "Placa",

                      // contentPadding:EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      contentPadding: EdgeInsets.only(
                        left: 12,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      )),
                ),
              ),
            ],
          ), */
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text("BTC ₿:"),
                ),
                Text("1"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                  ),
                  child: Text("USD \$"),
                ),
                Obx(() => Text(
                      controller.usd.value,
                      style: TextStyle(color: Colors.green),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text("BRL \$"),
                ),
                Obx(() => Text(
                      controller.brl.value,
                      style: TextStyle(color: Colors.green),
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                //primary: Color.fromARGB(255, 129, 212, 250),
                primary: Colors.orange,
                //onPrimary: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13)),
                padding: EdgeInsets.all(12),
              ),
              onPressed: () {
                controller.recuperarPreco();
              },
              child: Text("Atualizar"),
            ),
          )
        ],
      ),
    );
  }
}
