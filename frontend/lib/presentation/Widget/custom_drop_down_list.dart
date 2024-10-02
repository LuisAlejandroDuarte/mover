import 'package:flutter/material.dart';

class CustomDropDownList<T> extends StatelessWidget {
  final String hint;
  final T? value;
  final List<T> items;
  final ValueChanged<T?>? onChanged;
  final String Function(T) itemLabel;

  const CustomDropDownList({super.key, 
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.itemLabel,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      hint: Text(hint),
      value: value,
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(itemLabel(value)),
        );
      }).toList(),
      isExpanded: true,     
    );
  }
}
