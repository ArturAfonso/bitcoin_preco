import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxString usd = "0".obs;
  RxString brl = "0".obs;

  void recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    usd.value = retorno["USD"]["buy"].toString();
    brl.value = retorno["BRL"]["buy"].toString();
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
