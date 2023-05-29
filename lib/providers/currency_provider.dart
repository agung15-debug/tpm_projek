import 'package:flutter/material.dart';
import 'package:final_tpm/services/currency_service.dart';

class CurrencyProvider with ChangeNotifier {
  List<String> _currencies = [];
  List<String> get currencies => _currencies;
  set currencies(List<String> currencies) {
    _currencies = currencies;
    notifyListeners();
  }

  double _rate = 0.0;
  double get rate => _rate;
  set rate(double rate) {
    _rate = rate;
    notifyListeners();
  }

  Future<void> getCurrencies() async {
    try {
      List<String> currencies = await CurrencyApi().getCurrencies();
      _currencies = currencies;
    } catch (e) {
      print(e);
    }
  }

  Future<double> getRate(String from, String to) async {
    try {
      double rate = await CurrencyApi().getRate(from, to);
      _rate = rate;
      return rate;
    } catch (e) {
      print(e);
      throw Exception('Gagal mendapatkan rate provider');
    }
  }
}
