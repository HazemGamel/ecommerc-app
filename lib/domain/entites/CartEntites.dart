
import 'package:equatable/equatable.dart';

class CartEntites extends Equatable{
  final String CartId;
  final List<CartItemEntites> cartItems;
  final int totalprice;
const  CartEntites(this.CartId, this.cartItems,this.totalprice);
  @override
  // TODO: implement props
  List<Object?> get props =>[CartId,cartItems,totalprice];

}


class CartItemEntites extends Equatable{
  final String id;
  final int price;
  final int quantity;
  final String productId;
  final String image;
  final String title;

const  CartItemEntites(this.id, this.price, this.quantity,
    this.productId,this.title,this.image);

  @override
  // TODO: implement props
  List<Object?> get props => [id,price,quantity,productId,image,title];

}