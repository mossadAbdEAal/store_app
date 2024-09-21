import 'dart:convert';

import 'package:http/http.dart 'as http;
import 'package:store_app/models/all_products.dart';

class Getallproducts {
  Future<List<Productmodel>> getproducts() async {

    Map<String, String> headers = {};
     headers.addAll({'Accept': 'application/json'});
     headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});


     http.Response response = await http.get(Uri.parse('https://fakestoreapi.com/products'),headers: headers);


    if (response.statusCode == 200) {
      dynamic data=jsonDecode(response.body);
      
      List<Productmodel> products = [];
      for (var product in data) {
      products.add(Productmodel.fromJson(product));
      }
    return products;
    } else {
      throw Exception(
          'There is problem with status Code ${response.statusCode}');
    }
  
  }
}
