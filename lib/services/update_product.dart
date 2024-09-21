import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/all_products.dart';

class Updateproductservice {
  Future<Productmodel> updateproduct(
      {required String title,
      required String price,
      required String desc,
      required String img,
      required String categpry,
      required int id}) async {
    
  
    Map<String, dynamic> data=
      // ignore: missing_required_param
      await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
    'title': title,
    'price': price,
    'description': desc, 
    'image': img,
    'category': categpry,
  });
  return Productmodel.fromJson(data);



  }
}