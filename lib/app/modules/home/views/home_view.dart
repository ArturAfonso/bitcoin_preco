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
  @override
  Widget build(BuildContext context) {
    HomeController controller = HomeController();

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
              Container(
                width: 30,
                child: TextFormField(
                  controller: controller.qtdController,
                ),
              ),
              Container(
                child: Obx(() => DropdownButton(
                      items: [
                        DropdownMenuItem(child: Text("BRL"), value: "BRL"),
                        DropdownMenuItem(child: Text("USD"), value: "USD"),
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
                //controller.recuperarPreco();
              },
              child: Text("Atualizar"),
            ),
          )
        ],
      ),
    );
  }
}
