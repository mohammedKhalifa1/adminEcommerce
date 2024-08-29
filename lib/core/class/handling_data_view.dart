import 'package:flutter/material.dart';

import 'status_request.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.failure
        ? const Center(
            child: Text("Failure"),
          )
        : statusRequest == StatusRequest.loading
            ? const Center(
                child: Text("Loading"),
              )
            : widget;
  }
}
