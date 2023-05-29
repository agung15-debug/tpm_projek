import 'dart:async';

import 'package:final_tpm/providers/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:final_tpm/theme.dart';
import 'package:provider/provider.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  List<String> currencies = [];
  String from = "IDR";
  String to = "USD";
  double? rate;
  String result = "";

  @override
  Widget build(BuildContext context) {
    CurrencyProvider currencyProvider = Provider.of<CurrencyProvider>(context);
    TextEditingController _inputUser = TextEditingController();

    currencies = currencyProvider.currencies;
    Widget customDropdown(
        List<String> items, String value, void onChange(val)) {
      return Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor1,
          border: Border.all(color: primaryTextColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton<String>(
          dropdownColor: backgroundColor2,
          onChanged: (String? value) {
            onChange(value);
          },
          value: value,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            );
          }).toList(),
        ),
      );
    }

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

    Widget content() {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: customDropdown(
                      currencies,
                      to,
                      (val) {
                        setState(() {
                          to = val!;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: backgroundColor1,
                      border: Border.all(color: primaryTextColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          result,
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: customDropdown(
                      currencies,
                      from,
                      (val) {
                        setState(() {
                          from = val!;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextField(
                      controller: _inputUser,
                      keyboardType: TextInputType.number,
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        filled: true,
                        fillColor: backgroundColor1,
                        hintText: 'Input Amount',
                        hintStyle: primaryTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: primaryTextColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: primaryTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {
                    rate = await currencyProvider.getRate(from, to);
                    setState(() {
                      result = (rate! * double.parse(_inputUser.text))
                          .toStringAsFixed(3);
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Convert',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60), child: header()),
      body: content(),
    );
  }
}
