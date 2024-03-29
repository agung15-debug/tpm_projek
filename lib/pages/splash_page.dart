import 'dart:async';

import 'package:final_tpm/providers/currency_provider.dart';
import 'package:final_tpm/providers/product_provider.dart';
import 'package:final_tpm/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    await Provider.of<CurrencyProvider>(context, listen: false).getCurrencies();
    Navigator.pushNamed(context, '/sign-in');
  }

  void initState() {
    getInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
          child: Container(
              width: 130,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image_splash.png',
                  ),
                ),
              ))),
    );
  }
}
