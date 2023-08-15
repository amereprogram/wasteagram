import 'dart:io';

class FoodEntry {
  
  late String? date;
  late String? imageURL;
  late int? quantity;
  late double? latitude;
  late double? longitude;

  FoodEntry({ this.date, this.imageURL, this.quantity, this.latitude, this.longitude});

  FoodEntry.fromPost({var post} ) {
    this.date = post['date'];
    this.imageURL = post['imageURL'];
    this.quantity = post['quantity'];
    this.latitude = post['latitude'];
    this.longitude = post['longitude'];
  }

  FoodEntry.fromMap(Map <String,dynamic> map) {
    date = map['date'];
    imageURL= map['imageURL'];
    quantity = map['quantity'];
    latitude = map['latitude'];
    longitude = map['longitude'];  
  }
}
