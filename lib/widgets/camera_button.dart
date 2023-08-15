import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../screens/camera_screen.dart';

class CameraButton extends StatelessWidget {
  
   CameraButton ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.5,
      heightFactor: 0.5,
      child: ButtonTheme(
        minWidth: 200.0,
        height: 100.0,
        child: IconButton(
          
                    iconSize: 50.0,
                    icon: const Icon(Icons.camera_alt, color: Colors.cyan,),               
                    onPressed: () {                                        
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CameraScreen()));                    
                    }
                    
        ),
      ),
    );
  }
}
