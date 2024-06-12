import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoop/pages/cart_page.dart';
import 'package:shoop/pages/checkout_page.dart';
import 'package:shoop/pages/checkout_success.dart';
import 'package:shoop/pages/detail_chat.dart';
import 'package:shoop/pages/edit_profile.dart';
import 'package:shoop/pages/home/main_page.dart';
import 'package:shoop/pages/product_page.dart';
import 'package:shoop/pages/sign_in_page.dart';
import 'package:shoop/pages/sign_up_page.dart';
import 'package:shoop/pages/splash_page.dart';
import 'package:shoop/providers/auth_provider.dart';
import 'package:shoop/widgets/product_cart.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfile(),
          '/product': (context) => ProductPage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccess()
        },
        // home: SplashPage(),
      ),
    );
  }
}
