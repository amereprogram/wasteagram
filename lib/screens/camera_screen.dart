import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../models/food_WastePost.dart';
import '../widgets/upload_button.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final formKey = GlobalKey<FormFieldState>();
  File? image;
  final picker = ImagePicker();
  final wasteEntry = FoodEntry();


  void getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);
    FirebaseStorage storageReference = FirebaseStorage.instance;
    Reference ref = storageReference.ref().child("image" + DateTime.now().toString() + '.jpg');
    UploadTask uploadTask = ref.putFile(image!);
    final url = await (await uploadTask).ref.getDownloadURL();
    wasteEntry.imageURL = url;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      getImage();
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios),    // color: Colors.black
                              onPressed: () => Navigator.of(context).pop(),
                    ),
          title: Text('New Post')),
          body: Center(child: CircularProgressIndicator())
      );
      
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios),    // color: Colors.black
                              onPressed: () => Navigator.of(context).pop(),
                    ),
          title: Text('New Post'),
        ),
        body: Center(
          child: Column (
            children: [
              ConstrainedBox(constraints: BoxConstraints(maxHeight: 300), child: Image.file(image!)),
              SizedBox(height: 40),
              Semantics(
                label: 'quantity form',
                enabled: true,
                onTapHint: 'quantity form',
                child: quantityForm()),
              
            ],
          ) 
        ),
        floatingActionButton: Semantics(
          label: 'upload photo and quantity',
          hint: 'upload photo and quantity',
          button: true,
          enabled: true,
          onTapHint: 'upload photo and quantity', 
          child: UploadButton(formKey: formKey, wasteEntry: wasteEntry)
          ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    }  
  }

  Widget quantityForm() {    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        key: formKey,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(hintText: 'Number of Wasted Items'),
        onSaved: (value) {
            wasteEntry.quantity = int.parse(value!);
            // print(wasteQuant.quantity);
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


