import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preço do Bitcoin'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
            child: Image.asset('imagens/logobtc.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
            child: Text("BTC: "),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
            child: Text("DÓLAR: "),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
            child: Text("REAL: "),
          ),
        ],
      ),
    );
  }
}
