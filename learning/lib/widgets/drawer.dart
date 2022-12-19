import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {

  String imageUrl ="https://cdn-icons-png.flaticon.com/512/149/149071.png";
  
  @override
  Widget build(BuildContext context) {
     return Drawer(
       child:Container(
         color: Colors.teal,
         child: ListView(
           padding: EdgeInsets.zero,
           children: [
             DrawerHeader(
                 child: UserAccountsDrawerHeader(
                   margin: EdgeInsets.zero,
                     accountName: Text("Demo"),
                     accountEmail: Text("test@gmail.com"),
                     currentAccountPicture: CircleAvatar(
                       backgroundImage: NetworkImage(imageUrl),
                     ), ),
               padding: EdgeInsets.zero,
             ),
             ListTile(leading: Icon(
               CupertinoIcons.home,
               color: Colors.white,
             ),
               title: Text("Home",
                   textScaleFactor: 1.2,
                   style:TextStyle(
                 color: Colors.white
               )),
             ),
             ListTile(leading: Icon(
               CupertinoIcons.profile_circled,
               color: Colors.white,
             ),
               title: Text("Profile",
                   textScaleFactor: 1.2,
                   style:TextStyle(
                       color: Colors.white
                   )),
             )
           ],
         ),
       ),
     );
    throw UnimplementedError();
  }
}
