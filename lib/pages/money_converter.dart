import 'dart:async';

import 'package:flutter/material.dart';
import 'package:final_tpm/theme.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryTextColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Currency Converter',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60), child: header()),
    );
  }
}
