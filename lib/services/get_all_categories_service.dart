import 'package:store_app/helpers/api.dart';
class Getallcategories {
  Future<dynamic> getallcategories() async {
   dynamic data =
        // ignore: missing_required_param
        Api().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
