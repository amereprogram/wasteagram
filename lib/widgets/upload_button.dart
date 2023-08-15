import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import '../models/food_WastePost.dart';

class UploadButton extends StatefulWidget {
  final formKey;
  String? url;
  // int? quantity;
  final FoodEntry wasteEntry;

  UploadButton({Key? key, this.formKey, required this.wasteEntry}) : super(key: key);

  @override
  State<UploadButton> createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  
  final uploadToModel = FoodEntry();
  Position? locationData;
  get quantity => null;

@override
  void initState() {
    super.initState();
    _determinePosition();
  }

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position?> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  locationData =  await Geolocator.getCurrentPosition();

  setState(() {});
  return locationData;
}

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.cloud_upload_rounded),
        onPressed: () {
          if (widget.formKey.currentState!.validate()) {
              widget.formKey.currentState?.save();
          }         
          FirebaseFirestore.instance
              .collection('posts')
              .add({
                'date': '${DateFormat.yMMMMEEEEd().format(DateTime.now())}', 
                'imageURL': widget.wasteEntry.imageURL, 
                'latitude': locationData!.latitude, 
                'longitude': locationData!.longitude,
                'quantity': widget.wasteEntry.quantity             
                });
          Navigator.of(context).pop();
        });
  }
}