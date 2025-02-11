
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';


Widget dropDownButton({
  required List<String> items,
  required String labelText,
  required String hintText,
  required Function(String?) onChanged,
  String? Function(String?)? validator,
  String? selectedValue,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          labelText,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color:ThemeColor.black54,
          ),

        ),
      ),
      const SizedBox(height: 4),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(
          //   color: ThemeColor.grey.withOpacity(.4),
          // ),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 900,
          ),
          child: DropdownButtonFormField2(
            value: selectedValue,
            items: items
                .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
                .toList(),
            onChanged: onChanged,
            validator: validator,
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                ///this the color of dropdown list!
                color: Colors.white,
              ),
            ),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),

                border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.black54,),borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: ThemeColor.yellow),borderRadius: BorderRadius.circular(10))
            ),
            hint: Text(
              hintText,
              style:  TextStyle(
                color: ThemeColor.glueGrey.withOpacity(0.5),
                fontSize: 15,
              ),
            ),
          ),
        ),
      )

    ],
  );
}
