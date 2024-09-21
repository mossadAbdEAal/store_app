import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/all_products.dart';

class Categoriesservice {
  Future<List<Productmodel>> getcategories(
      {required String categoryname})  async {
    dynamic data = await Api()
        // ignore: missing_required_param
        .get(url: 'https://fakestoreapi.com/products/category/$categoryname');

    List<Productmodel> products = [];
    for (var product in data) {
      products.add(Productmodel.fromJson(product));
    }
    return products;
  }
}
