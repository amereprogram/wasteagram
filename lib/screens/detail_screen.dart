import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../models/food_WastePost.dart';

class DetailScreen extends StatefulWidget {

  final FoodEntry post;
  
  DetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  
  Widget layout() {
    return Column(
      children: [
        Flexible(flex: 1, child: Center(child: Text(widget.post.date!, style: TextStyle(fontSize: 25)))),
        Flexible(flex: 2, child: Image.network(widget.post.imageURL!)),
        Flexible(flex: 2, child: Center(child: Text('${widget.post.quantity!.toString()} items', style: TextStyle(fontSize: 35)))),
        Flexible(flex: 1, child: Center(child: ConstrainedBox(constraints: BoxConstraints(maxWidth: 300), child: Text('Location: (${widget.post.latitude!.toStringAsFixed(6)}, ${widget.post.longitude!.toStringAsFixed(6)})', style: TextStyle(fontSize: 15))))),
      ],
    );
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wasteagram')),
      body: layout()
    );
  }
}