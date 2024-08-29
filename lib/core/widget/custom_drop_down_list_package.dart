import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropDownList extends StatefulWidget {
  final String title;
  final List<SelectedListItem> listData;
  final TextEditingController controllerName;
  final TextEditingController controllerValue;
  const CustomDropDownList(
      {super.key,
      required this.title,
      required this.listData,
      required this.controllerName,
      required this.controllerValue});

  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  void showDropDownSearch() {
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "Chose",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listData,
        onSelected: (List<dynamic> selectedList) {
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              widget.controllerName.text = item.name;
              widget.controllerValue.text = item.value!;
            }
          }
        },
        enableMultipleSelection: false, // to choose another one
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: widget.controllerName,
        cursorColor: Colors.black,
        onTap: () {
          FocusScope.of(context).unfocus();
          showDropDownSearch();
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black12,
          contentPadding:
              const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
          hintText: widget.title,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
