

import 'package:shoping/domain/entites/CartEntites.dart';

class CartModel extends CartEntites{
 const CartModel({required String CartId,
   required List<CartItemEntites> cartItems,required int totalprice})
      : super(CartId, cartItems,totalprice);
  factory CartModel.fromJson(Map<String,dynamic>json){
    return CartModel(
        CartId: json["_id"],
        totalprice: json["totalprice"],
        cartItems: List<CartItemModel>.
        from(json["cartItems"].map((e)=>CartItemModel.fromJson(e)))
    );
  }
}

class CartItemModel extends CartItemEntites{
  CartItemModel({required String id,required int price,required int quantity,
     required String productId,required String title,required String image})
      : super(id, price, quantity, productId, title, image);



 factory CartItemModel.fromJson(Map<String,dynamic>json){
   return CartItemModel(
       id: json["_id"],
       price: json["price"],
       quantity: json["quantity"],
       productId: json["product"],
     title: json["title"],
     image: json["image"],);
 }

}