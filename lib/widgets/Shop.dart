import 'package:flutter/material.dart';

class MyShop extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShoppingList(
        products: <Product>[
          Product(name:'aaa'),
          Product(name:'bbb'),
          Product(name:'ccc'),
          Product(name:'ddd'),
          Product(name:'eee'),
          Product(name:'fff'),
          Product(name:'ggg'),
        ],
      ),
    );
  }
  
}


class Product{
  const Product({this.name});
  final String name;
}

typedef void CartChangeCallback(Product product,bool inCart);


class ShoppingListItem extends StatelessWidget{
  ShoppingListItem({Product product,this.inCart,this.onCartChange})
      : product = product,super(key:ObjectKey(product));
  
  final Product product;
  final bool inCart;
  final CartChangeCallback onCartChange;
  
  Color _getColor(BuildContext context){
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }
  
  TextStyle _getTextStyle(BuildContext context){
    if(!inCart) return null;
    
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onCartChange(product,!inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),),
    );
  }
}


class ShoppingList extends StatefulWidget{
  ShoppingList({Key key,this.products}) : super(key:key);
  
  final List<Product> products;
  
  @override
  State<StatefulWidget> createState() => ShoppingListState();
}



class ShoppingListState extends State<ShoppingList>{
  Set<Product> _set = Set<Product>();
  
  void _handleCardChange(Product product,bool inCart){
    setState(() {
      if(inCart){
        _set.add(product);
      }else{
        _set.remove(product);
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List Test'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product){
          return ShoppingListItem(
            product: product,
            inCart: _set.contains(product),
            onCartChange: _handleCardChange,
          );
        }).toList(),
      ),
    );
  }
  
}
