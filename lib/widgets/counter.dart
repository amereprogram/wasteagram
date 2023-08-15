import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/models/food_WastePost.dart';


class Counter extends StatefulWidget {

  var wasteTitle;
  
  Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}
class _CounterState extends State<Counter> {
  
   @override
  Widget build(BuildContext context) {
    return Container(height: 25,
      // child: Text('wow')
      child: StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection('posts').snapshots(),
                  builder:
                    (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                        var wasteTitle = 0;
                        snapshot.data!.docs.forEach((element) {wasteTitle += element['quantity'] as int;
                        });
                      
                      return Text('Wasteagram - $wasteTitle'); 
                      } else {
                        return Text('Wasteagram'); 
                      }
                    }
                      
                    
                      
                    //   (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    // if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    //   widget.wasteTitle = 0;                                        
                    //   return SingleChildScrollView(
                    //     reverse: true,
                    //     child: ListView.builder(
                    //       key: UniqueKey(),
                    //         padding: EdgeInsets.only(left: 95),
                    //         shrinkWrap: true,
                    //         clipBehavior: Clip.none,
                    //         itemCount: snapshot.data!.docs.length,                       
                    //         itemBuilder: (context, index) {
                    //           var post = snapshot.data!.docs[index];
                    //           FoodEntry wasteCounter = FoodEntry.fromPost(post: post);
                    //           widget.wasteTitle += wasteCounter.quantity as int;                              
                    //           return Text('Wasteagram - ${widget.wasteTitle}');                                                 
                    //         }
                    //     ),
                    //   );
                      
                    
                    //  widget.wasteTitle = 0;
                    // return  Text('Wasteagram - ${widget.wasteTitle}');
      ),                   
    );
  }
  
}