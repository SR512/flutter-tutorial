import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningapp/Models/cart.dart';
import 'package:learningapp/widgets/Themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent, title: "Cart".text.make()),
      backgroundColor: MyThems.creamColor,
      body: Column(
        children: [CartList().p32().expand(), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalprice}".text.xl5.color(context.primaryColor).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () => {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying not supported".text.make()))
            },
            child: "Buy".text.white.make(),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyThems.darkBluishColor)),
          ).w32(context)
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget{
  @override
  CartListState createState() => CartListState();
}
class CartListState extends State<CartList> {

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _cart.items.length , itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
      trailing: IconButton(
        onPressed: () {  },
        icon:Icon(Icons.remove_circle_outline),
      ),
      title: _cart.items[index].name.text.make(),
    ));
  }
}
