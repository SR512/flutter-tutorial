import 'package:flutter/material.dart';
import 'package:learningapp/Models/Catalog.dart';

class ItemWidget extends StatelessWidget{
  final Item item;

  const ItemWidget({Key? key,required this.item}) :assert(item != null),super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
     child: Card(
       child: ListTile(
         onTap: () {
           print("${item.name} pressed");
         },
         leading:Image.network(item.img),
         title: Text(item.name),
         subtitle: Text(item.desc),
         trailing: Text("\$${item.price.toString()}",textScaleFactor:1.5,style: TextStyle(
             color: Colors.deepPurple,
             fontWeight: FontWeight.bold
         ),),
       ),
     )
   );
  }

}