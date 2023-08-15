import 'package:flutter/material.dart';
import 'package:wasteagram/models/food_WastePost.dart';

class EntryForm extends StatefulWidget {

  EntryForm ({Key? key}) : super(key: key);

  @override
  State<EntryForm> createState() => _EntryFormState();
}


final wasteQuant = FoodEntry();

class _EntryFormState extends State<EntryForm> {

  final formKey = GlobalKey<FormFieldState>();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        key: formKey,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(hintText: 'Number of Wasted Items'),
        onSaved: (value) {
            wasteQuant.quantity = int.parse(value!);
            print(wasteQuant);
        },
        validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a number';
                  } else {
                    return null;
                  }
                },
        style: const TextStyle(fontSize: 20),
        )
      );
  }
}