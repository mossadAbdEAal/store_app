import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/all_products.dart';

class Addproduct {
  Future<Productmodel> addproduct(
      {
      required String title,
      required String price,
      required String desc,
      required String img,
      required String categpry}) async {
    
  
    Map<String, dynamic> data=
      // ignore: missing_required_param
      await Api().post(url: 'https://fakestoreapi.com/products', body: {
    'title': title,
    'price': price,
    'description': desc, 
    'image': img,
    'category': categpry,
    
  });
  return Productmodel.fromJson(data);



  }
}
