import 'package:flutter/material.dart';
import 'package:store_app/models/all_products.dart';
import 'package:store_app/views/product_details.dart';



// ignore: must_be_immutable
class Customcardwidget extends StatelessWidget
{
  Customcardwidget({super.key,required this.product});
  Productmodel product;

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return  ProductDetails(productmodel: product,);
      }));
    },
     child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(2, 6),
                          blurRadius: 5)
                    ]),
                child: Card(
                   surfaceTintColor: Colors.white,
                
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  elevation: 10,
                  
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(product.title.substring(0,10),style: const TextStyle(color: Colors.black45),),
                       const  SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding:const  EdgeInsets.only(bottom: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(r'$''${product.price.toString()}'),
                              const Padding(
                                padding: EdgeInsets.only(right: 20.0),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 85,
                  left: 30,
                  child: Image.network(
                    product.image,
                    width: 145,
                    height: 100,
                  )),
            ],
          ),
   );
  }
  
}