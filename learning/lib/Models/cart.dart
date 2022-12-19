import 'package:learningapp/Models/Catalog.dart';

class CartModel{

  // catalog field
  late Catalog _catalog;

  //Collection of ids
  final List<int> _itemIDs = [];

  Catalog get catalog => _catalog;

  set catalog(Catalog newcatalog){
    assert(newcatalog != null);
    _catalog = newcatalog;
  }

  //Get Items in the cart
  List<Item> get items => _itemIDs.map((id) => _catalog.getByID(id)).toList();

  // Get total price
  num get totalprice => items.fold(0, (total, current) => total + current.price);

  // Add Item
  void add(Item item){
    _itemIDs.add(item.id.toInt());
  }

  // Remove Item
  void remove(Item item){
    _itemIDs.remove(item.id);
  }
}