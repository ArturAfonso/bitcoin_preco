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
  RxString dropDownValuePRI = "BTC".obs;
  RxString primarySimbol = "  \₿".obs;
  RxString dropDownValueSEC = "BRL".obs;
  RxString secundarySimbol = "R\$".obs;

  /* RxDouble usd = 0.0.obs;
  RxDouble brl = 0.0.obs;
  RxDouble btc = 0.0.obs; */
  RxDouble valorConvertido = 0.0.obs;

  int valueToConvert = 0;
  RxString primaryCurrency = "".obs;
  RxString secondaryCurrency = "".obs;

  RxString returnCurrency = "".obs;

  /*  void recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    usd.value = retorno["USD"]["buy"];
    brl.value = retorno["BRL"]["buy"];
  } */

  currencyReturn(String primaryCurrency, String secundaryCurrency) async {
    int qtd = int.parse(qtdController.text);
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);

    valorConvertido.value = (retorno["${secondaryCurrency}"]["buy"] * qtd);
  }

  void onInit() {
    super.onInit();
//    recuperarPreco();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
