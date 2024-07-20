import 'package:get/get.dart';
import 'package:my_project/core/constant/pageroute.dart';
import 'package:my_project/core/middleware/mymiddleware.dart';
import 'package:my_project/test_view.dart';
import 'package:my_project/view/screen/address/add.dart';
import 'package:my_project/view/screen/address/view.dart';

import 'package:my_project/view/screen/cart.dart';
import 'package:my_project/view/screen/changelanguage.dart';
import 'package:my_project/view/screen/checkout.dart';
import 'package:my_project/view/screen/myfavorite.dart';
import 'package:my_project/view/screen/onboarding.dart';
import 'package:my_project/view/screen/auth/forgotpassword.dart';
import 'package:my_project/view/screen/auth/login.dart';
import 'package:my_project/view/screen/auth/resetpassword.dart';
import 'package:my_project/view/screen/auth/signup.dart';
import 'package:my_project/view/screen/auth/succes_resetpassword.dart';
import 'package:my_project/view/screen/auth/success_signup.dart';
import 'package:my_project/view/screen/auth/verifycode.dart';
import 'package:my_project/view/screen/homescreens.dart';
import 'package:my_project/view/screen/items.dart';
import 'package:my_project/view/screen/language.dart';
import 'package:my_project/view/screen/itemdetails.dart';
import 'package:my_project/view/screen/order/archive.dart';
import 'package:my_project/view/screen/order/archivedetails.dart';
import 'package:my_project/view/screen/order/details.dart';
import 'package:my_project/view/screen/order/pending.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
  

      name: "/",
      page: () => const Language(),
      middlewares: [MyMiddleWare()]),
  GetPage(
    name: AppRoutes.language,
    page: () => const Language(),
  ),
  GetPage(
    name: AppRoutes.login,
    page: () => const Login(),
  ),
  GetPage(
    name: AppRoutes.signUp,
    page: () => const SignUP(),
  ),
  GetPage(
    name: AppRoutes.onBoarding,
    page: () => const OnBoarding(),
  ),
  GetPage(
    name: AppRoutes.forgotPassword,
    page: () => const ForgotPassword(),
  ),
  GetPage(
    name: AppRoutes.verifycode,
    page: () => const VerifyCode(),
  ),
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(
    name: AppRoutes.successSignUp,
    page: () => const SuccessSignUp(),
  ),
  GetPage(
    name: AppRoutes.testView,
    page: () => const TestView(),
  ),
  GetPage(
    name: AppRoutes.homePage,
    page: () => const HomeScreens(),
  ),
  GetPage(
    name: AppRoutes.items,
    page: () => const Items(),
  ),
  GetPage(
    name: AppRoutes.productsDetails,
    page: () => const ItemDetails(),
  ),
  GetPage(
    name: AppRoutes.myfavorite,
    page: () => const MyFavorite(),
  ),
  GetPage(
    name: AppRoutes.cart,
    page: () => const Cart(),
  ),
  GetPage(
    name: AppRoutes.checkOut,
    page: () => const CheckOut(),
  ),
  GetPage(
    name: AppRoutes.viewAddress,
    page: () => const ViewAddress(),
  ),
  GetPage(
    name: AppRoutes.addAddress,
    page: () => const AddAddress(),
  ),
  GetPage(
    name: AppRoutes.pendingOrders,
    page: () => const PendingOrders(),
  ),
  GetPage(
    name: AppRoutes.ordersDetails,
    page: () => const OrdersDetails(),
  ),
  GetPage(
    name: AppRoutes.ordersArchive,
    page: () => const OrdersArchive(),
  ),
  GetPage(
    name: AppRoutes.ordersArchiveDetails,
    page: () => const OrdersArchiveDetails(),
  ),
  GetPage(
    name: AppRoutes.changeLanguage,
    page: () => const ChangeLanguage(),
  ),
];
