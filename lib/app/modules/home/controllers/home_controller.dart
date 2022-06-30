import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  TextEditingController qtdController =
      TextEditingController(text: 1.toString());
  RxString dropDownValuePRI = "BRL".obs;
  RxString primarySimbol = "  \₿".obs;
  RxString dropDownValueSEC = "BRL".obs;
  RxString secundarySimbol = "R\$".obs;

  RxDouble usd = 0.0.obs;
  RxDouble brl = 0.0.obs;
  RxString btc = "0.0".obs;
  RxDouble valorConvertido = 0.0.obs;

  int valueToConvert = 0;
  RxString primaryCurrency = "".obs;
  RxString secondaryCurrency = "".obs;

  RxString returnCurrency = "".obs;

  void recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    usd.value = retorno["USD"]["buy"];
    brl.value = retorno["BRL"]["buy"];
  }

  currencyReturn(String primaryCurrency, String qtdCurrency) async {
    var tempqtd = qtdCurrency.replaceAll(RegExp(r','), '.');
    double? qtd = double.tryParse(tempqtd);
    String url = "https://blockchain.info/ticker";
    String url2 = "https://blockchain.info/tobtc?currency=USD&value=500";
    http.Response response1 = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno1 = json.decode(response1.body);

    retorno1.forEach((key, value) {
      print(value["symbol"]);
    });
    http.Response response = await http.get(Uri.parse(
        "https://blockchain.info/tobtc?currency=${primaryCurrency}&value=${qtd}"));
    valorConvertido.value = double.parse(response.body);
    //Map<String, dynamic> retorno = json.decode(response.body);
  }

  void onInit() {
    super.onInit();
    recuperarPreco();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
