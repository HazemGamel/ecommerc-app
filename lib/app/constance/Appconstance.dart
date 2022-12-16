
//const String BASEURL ="https://node-api-shop-app.herokuapp.com/api/v1";
const String BASEURL ="http://192.168.1.8:3000/api/v1";
class AppConstance {
  static const String REGISTERLINK ="$BASEURL/auth/signup";
  static const String LOGINLINK ="$BASEURL/auth/login";
  static const String CHECKEMAIL ="$BASEURL/auth/forgotpassword";
  static const String VERIFYCODE ="$BASEURL/auth/verifyRestCode";
  static const String RESTPASSWORD ="$BASEURL/auth/restpassword";
  static const String GetCategories ="$BASEURL/categories";
  static const String GetProducts ="$BASEURL/products";
  static const String GetBrands ="$BASEURL/brands";
  static const String AddProductToFav ="$BASEURL/wishlist";
  static const String GetWishlist ="$BASEURL/wishlist";
  static const String AddProductToCart ="$BASEURL/cart";
  static const String GetallCart ="$BASEURL/cart";
  static const String Address ="$BASEURL/addresses";
  static const String userData ="$BASEURL/users/getme";
  static  String RemovefromFav(id) => "$BASEURL/wishlist/$id";
  static  String Removefromcart(id) => "$BASEURL/cart/$id";
  static  String Search( String text) => "$BASEURL/products?keyword=${text.trim().toString()}";
  static  String paymentUrl(id) => "$BASEURL/orders/checkout/$id";
  static  String GetProductDetails(id) => "$BASEURL/products/$id";
  static const String contentType ="Content-Type";
  static const String applicationJson ="application/json";
}

