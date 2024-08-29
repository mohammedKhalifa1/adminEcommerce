import 'dart:io';

import 'package:admin_ecommerce/controller/home_controller.dart';
import 'package:admin_ecommerce/core/class/route_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/class/class_val.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    List<Chose> chose = [
      Chose("Categories", () {
        Navigator.of(context).pushNamed(RouteName.catView);
      }),
      Chose("items", () {
        Navigator.of(context).pushNamed(RouteName.itemView);
      }),
      Chose("orders", () {
        Navigator.of(context).pushNamed(RouteName.orderView);
      }),
    ];
    return ChangeNotifierProvider<HControllerImp>(
      create: (context) => HControllerImp(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              exit(0);
            },
          ),
        ),
        body: Consumer<HControllerImp>(
          builder: (context, model, child) => GridView.builder(
            itemCount: chose.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) => InkWell(
              onTap: chose[index].onTap,
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                color: Colors.green,
                child: Center(
                  child: Text(
                    chose[index].name,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
