import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/categories_view.dart';
import '../../../core/class/class_app_name.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/class/route_name.dart';

class CatViewWidget extends StatefulWidget {
  const CatViewWidget({super.key});

  @override
  State<CatViewWidget> createState() => _CatViewWidgetState();
}

class _CatViewWidgetState extends State<CatViewWidget> {
  @override
  void initState() {
    context.read<CatViewControllerImp>().view();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CatViewControllerImp>(
      builder: (context, request, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(RouteName.catAdd);
          },
          child: const Text(AppName.catViewButtonNav),
        ),
        appBar: AppBar(
          title: const Text(AppName.catViewAppBar),
        ),
        body: HandlingDataView(
          statusRequest: request.statusRequest,
          widget: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                for (int i = 0; i < request.catModel.length; i++)
                  InkWell(
                    onTap: () {},
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          request.catModel[i].categoriesName!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
