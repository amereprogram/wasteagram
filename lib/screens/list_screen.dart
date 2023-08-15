import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:journal/screens/master_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/widgets/entryFrom.dart';
import '../screens/detail_screen.dart';
import '../widgets/camera_button.dart';
import '../widgets/counter.dart';
import '../models/food_WastePost.dart';


class ListScreen extends StatefulWidget {

  static const routeName = '/';
  
  ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {

   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Counter()),   //  Text('Wasteagram')
      body: Column(
        children: [
          Flexible(
            flex: 7,
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('posts').snapshots(),
                builder:
                    (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    return ListView.builder(
                        clipBehavior: Clip.none,
                        itemCount: snapshot.data!.docs.length,                       
                        itemBuilder: (context, index) {
                          var post = snapshot.data!.docs[index];
                          FoodEntry foodEntry = FoodEntry.fromPost(post: post);                         
                          return ListTile(
                              title: Text(foodEntry.date!, style: TextStyle(fontSize: 17)),
                              trailing: Text(foodEntry.quantity.toString(), style: TextStyle(fontSize: 21)),
                              onTap: () { Navigator.push(context,
                                MaterialPageRoute<Widget>(builder: (BuildContext context) {                            
                                  return DetailScreen(post: foodEntry,);
                                }),
                                );
                              }
                            );
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
              Flexible(
                flex: 3,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Semantics(
                    label: 'Select an image',
                    hint: 'Select an image',
                    child: CameraButton(),
                    button: true,
                    enabled: true,
                    onTapHint: 'Select an image', 
                    )
                  )
              )
              
        ],
      ),
    );
  }
}


