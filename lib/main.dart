import 'package:final_tpm/pages/cart_page.dart';
import 'package:final_tpm/pages/checkout_page.dart';
import 'package:final_tpm/pages/product_page.dart';
import 'package:final_tpm/pages/checkout_success_page.dart';
import 'package:flutter/material.dart';
import 'pages/splash_page.dart';
import 'pages/sign_in_page.dart';
import 'pages/sign_up_page.dart';
import 'pages/home/main_page.dart';
import 'pages/kesan_pesan_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/product': (context) => ProductPage(), // 'ProductPage()
        '/kesan-pesan': (context) => KesanPesanPage(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/checkout-success': (context) => CheckoutSuccessPage(),
      },
    );
  }
}