class AppLink {
  static const String server =
      "http://192.168.56.1/ecommerce"; //localhost change it with your database server host

//test page
  static const String test = "$server/test.php ";

// Authentecation
  static const String signUp = "$server/auth/signup.php ";
  static const String login = "$server/auth/login.php ";

// home
  static const String home = "$server/home.php ";
  static const String topselling = "$server/topselling.php ";

  //images
  static const String image = "$server/images/";
  static const String imageItems = "$image/items";

  // items
  static const String items = "$server/items/items.php";
  static const String search = "$server/items/search.php";

  // favorite
  static const String addFavorite = "$server/favorite/add.php";
  static const String removeFavorite = "$server/favorite/remove.php";
  static const String deleteFromFavorite =
      "$server/favorite/deletefromfavroite.php";
  static const String viewFavorite = "$server/favorite/view.php";

  //cart
  static const String cartAdd = "$server/cart/add.php";
  static const String cartDelete = "$server/cart/delete.php";
  static const String cartView = "$server/cart/view.php";
  static const String cartItemCount = "$server/cart/getitemcount.php";

  // coupon
  static const String checkCoupon = "$server/coupon/checkcoupon.php";

  //address

  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressDelete = "$server/address/delete.php";

// checkout

  static const String checkOut = "$server/orders/checkout.php";

  // Orders
  static const String pending = "$server/orders/pending.php";
  static const String archive = "$server/orders/archive.php";
  static const String ordersDetails = "$server/orders/details.php";
  static const String delete = "$server/orders/delete.php";
}
