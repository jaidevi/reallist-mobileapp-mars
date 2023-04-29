import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormElements extends GetxController {
  RxBool check = false.obs;
  getElements(widgetName) {
    if (widgetName["type"] == 'radio-group') {
    } else if (widgetName["type"] == 'checkbox-group') {
      return CheckboxListTile(
        //checkbox positioned at right
        value: check.value,
        onChanged: (bool? value) {
          print("---------> $value");
          check.value = value!;
        },
        title: Text("Option"),
      );
    }
  }

  button(lable) {
    return ElevatedButton(
      onPressed: () => {},
      child: Text(lable),
    );
  }

  checkBoxGroup(
      {required List<String> labels,
      required void Function(bool isChecked, String label, int index) onChange,
      required void Function(List<String> checked) onSelected}) {
    return checkBoxGroup(
      labels: <String>[
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
      ],
      onChange: (bool isChecked, String label, int index) =>
          print("isChecked: $isChecked   label: $label  index: $index"),
      onSelected: (List<String> checked) =>
          print("checked: ${checked.toString()}"),
    );
  }
}
