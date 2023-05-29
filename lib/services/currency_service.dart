import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyApi {
  String baseUrl = 'https://api.currencyapi.com/v3';
  String apiKey = '5PImaL5KtJ96rdLdzbOj2Ne28YvR94BOgabOv1Ve';

  Future<List<String>> getCurrencies() async {
    var url = '$baseUrl/latest?apikey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      List<String> currencies = data.keys.toList();
      return currencies;
    } else {
      throw Exception('Gagal mendapatkan currencies');
    }
  }

  Future<double> getRate(String from, String to) async {
    var url =
        '$baseUrl/latest?apikey=$apiKey&base_currency=$from&currencies=$to';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'][to]['value'];
      return data;
    } else {
      throw Exception('Gagal mendapatkan rate');
    }
  }
}
