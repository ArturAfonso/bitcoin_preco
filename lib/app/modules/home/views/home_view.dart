import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:brasil_fields/brasil_fields.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

/*   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.recuperarPreco();
  } */

  @override
  Widget build(BuildContext context) {
    HomeController controller = HomeController();
    Future.delayed(Duration(seconds: 2), () {
      controller.recuperarPreco();
    });
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Container(
                  width: 60,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.qtdController,
                  ),
                ),
              ),
              Container(
                child: Obx(() => DropdownButton(
                      items: [
                        DropdownMenuItem(child: Text("BRL"), value: "BRL"),
                        DropdownMenuItem(child: Text("USD"), value: "USD"),
                        //------------------------------------------
                        DropdownMenuItem(child: Text("ARS"), value: "ARS"),
                        DropdownMenuItem(child: Text("AUD"), value: "AUD"),
                        DropdownMenuItem(child: Text("CAD"), value: "CAD"),
                        DropdownMenuItem(child: Text("CHF"), value: "CHF"),
                        DropdownMenuItem(child: Text("CLP"), value: "CLP"),
                        DropdownMenuItem(child: Text("CNY"), value: "CNY"),
                        DropdownMenuItem(child: Text("CZK"), value: "CZK"),
                        DropdownMenuItem(child: Text("DKK"), value: "DKK"),
                        DropdownMenuItem(child: Text("EUR"), value: "EUR"),
                        DropdownMenuItem(child: Text("GBP"), value: "GBP"),
                        DropdownMenuItem(child: Text("HKD"), value: "HKD"),
                        DropdownMenuItem(child: Text("HRK"), value: "HRK"),
                        DropdownMenuItem(child: Text("HUF"), value: "HUF"),
                        DropdownMenuItem(child: Text("INR"), value: "INR"),
                        DropdownMenuItem(child: Text("ISK"), value: "ISK"),
                        DropdownMenuItem(child: Text("JPY"), value: "JPY"),
                        DropdownMenuItem(child: Text("KRW"), value: "KRW"),
                        DropdownMenuItem(child: Text("NZD"), value: "NZD"),
                        DropdownMenuItem(child: Text("PLN"), value: "PLN"),
                        DropdownMenuItem(child: Text("RON"), value: "RON"),
                        DropdownMenuItem(child: Text("RUB"), value: "RUB"),
                        DropdownMenuItem(child: Text("SEK"), value: "SEK"),
                        DropdownMenuItem(child: Text("SGD"), value: "SGD"),
                        DropdownMenuItem(child: Text("THB"), value: "THB"),
                        DropdownMenuItem(child: Text("TRY"), value: "TRY"),
                        DropdownMenuItem(child: Text("TWD"), value: "TWD"),
                      ],
                      value: controller.dropDownValuePRI.value,
                      hint: Obx(() => Text(controller.dropDownValuePRI.value)),
                      onChanged: (selectedValue) {
                        controller.dropDownValuePRI.value =
                            selectedValue.toString();
                        print(controller.dropDownValuePRI.value);
                        controller.primaryCurrency.value =
                            controller.dropDownValuePRI.value;
                      },
                    )),
              ),
            ],
          ),
          /*   Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                  ),
                  child: Obx(() => Text(
                      "${controller.dropDownValuePRI} ${controller.primarySimbol}")),
                ),
                Obx(() => Text(
                      UtilBrasilFields.removerSimboloMoeda(
                          UtilBrasilFields.obterReal(controller.usd.value)
                              .toString()),
                      style: TextStyle(color: Colors.green),
                    )),
              ],
            ),
          ), */
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text("BTC \₿"),
                ),
                Obx(() => Text(
                      controller.valorConvertido.value.toString(),
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
                controller.currencyReturn(controller.dropDownValuePRI.value,
                    controller.qtdController.text);
                controller.recuperarPreco();
                //controller.recuperarPreco();
              },
              child: Text("Consultar"),
            ),
          )
        ],
      ),
      bottomSheet: Container(
        width: Get.size.width,
        color: Colors.green[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Valor atual 1 BTC:",
              style: TextStyle(color: Colors.black54),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 5.0,
              ),
              child: Text("USD \$"),
            ),
            Obx(() => Text(
                  UtilBrasilFields.removerSimboloMoeda(
                      UtilBrasilFields.obterReal(controller.usd.value)
                          .toString()),
                  style: TextStyle(color: Colors.black54),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 1.0),
                  child: Text(" / BRL \$"),
                ),
                Obx(() => Text(
                      UtilBrasilFields.removerSimboloMoeda(
                          UtilBrasilFields.obterReal(controller.brl.value)
                              .toString()),
                      style: TextStyle(color: Colors.black54),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
