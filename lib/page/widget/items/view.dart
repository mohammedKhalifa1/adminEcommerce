import 'package:admin_ecommerce/core/class/route_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/item_view_controller.dart';
import '../../../core/class/class_app_name.dart';
import '../../../core/class/link.dart';
import '../../../core/widget/custom_button_with_out_color.dart';

class ItemsViewWidget extends StatefulWidget {
  const ItemsViewWidget({super.key});

  @override
  State<ItemsViewWidget> createState() => _ItemsViewWidgetState();
}

class _ItemsViewWidgetState extends State<ItemsViewWidget> {
  @override
  void initState() {
    context.read<ItemsViewControllerImp>().view();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RouteName.itemAdd);
        },
        child: const Text(AppName.itemViewButtonNav),
      ),
      appBar: AppBar(
        title: const Text(
          AppName.itemViewAppBar,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(RouteName.homeAdmin);
          },
        ),
      ),
      body: Consumer<ItemsViewControllerImp>(
        builder: (context, value, child) => SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < value.itemModel.length; i++)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 100,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                          "${AppLink.imageServer}${value.itemModel[i].itemsImage}"))),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(value.itemModel[i].itemsName!),
                                  CustomTextButtonWithOutColor(
                                    onPressed: () {},
                                    buttonName: "Edit",
                                  ),
                                  CustomTextButtonWithOutColor(
                                    onPressed: () {},
                                    buttonName: "Delete",
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
