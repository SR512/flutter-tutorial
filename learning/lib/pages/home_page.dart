import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:learningapp/Models/Catalog.dart';
import 'package:learningapp/pages/home_detail.dart';
import 'package:learningapp/utils/routes.dart';
import 'package:learningapp/widgets/Themes.dart';
import 'package:learningapp/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int days = 30;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogJson);
    Catalog.items = List.from(decodeData['data'])
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThems.creamColor,
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, Routes.cart_page);
      },
          backgroundColor: MyThems.darkBluishColor,
          child:Icon(CupertinoIcons.cart)),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Catalog App".text.xl4
                  .color(MyThems.darkBluishColor)
                  .bold
                  .make(),
              "Trending product".text.xl.make(),
              if (Catalog.items != null && Catalog.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: Catalog.items.length,
        itemBuilder: (context, index) {
          final catalog = Catalog.items[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => HomeDetail(catalog: catalog)));
            },
            child: CatalogItem(catalog: catalog),
          );
        }
    );
  }
}

class CatalogItem extends StatelessWidget {

  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            Hero(tag: Key(catalog.id.toString()), child: Image
                .network(catalog.img)
                .box
                .rounded
                .p8
                .make()
                .p16()
                .w40(context)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catalog.name.text.lg
                      .color(MyThems.darkBluishColor)
                      .bold
                      .make(),
                  catalog.desc.text.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalog.price}".text.bold.xl.make(),
                      _AddtoCart()
                    ],
                  ).pOnly(right: 8.0)
                ],
              ),
            )
          ],
        )
    ).white.rounded.square(150).make().py16();
  }
}


class _AddtoCart extends StatefulWidget{

  _AddtoCart({Key? key}): super(key: key);

  @override
  _AddtoCartState cartState() => _AddtoCartState();
}

class _AddtoCartState extends State<_AddtoCart>{

  final bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                MyThems.darkBluishColor),
            shape: MaterialStateProperty.all(StadiumBorder())
        ),
        child: "Add to cart".text.make()
    );
  }
}
// Padding(
// padding: const EdgeInsets.all(16.0),
// child: Catalog.items.length != null || Catalog.items.isNotEmpty ?
// // ListView.builder(
// //   itemCount: Catalog.items.length,
// //   itemBuilder: (context, index) => ItemWidget(item:Catalog.items[index]),
// // )
// GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 16,crossAxisSpacing: 16), itemBuilder: (context,index){
// final item =Catalog.items[index];
// return Card(
// clipBehavior: Clip.antiAlias,
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// child:GridTile(
// header: Container(
// child: Text(item.name,style: TextStyle(
// color: Colors.white
// )),
// padding: EdgeInsets.all(12),
// decoration: BoxDecoration(
// color: Colors.deepPurple
// ),
// ),
// child: Image.network(item.img),
// footer:Container(
// child: Text(item.price.toString(),style: TextStyle(
// color: Colors.white
// )),
// padding: EdgeInsets.all(12),
// decoration: BoxDecoration(
// color: Colors.black
// )),
// )
// );
// },itemCount:Catalog.items.length)
// : Center(
// child: CircularProgressIndicator(),
// ),
// )
