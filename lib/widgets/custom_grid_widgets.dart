import 'package:flutter/material.dart';
import 'package:store_app/models/all_products.dart';
import 'package:store_app/services/get_all_products.dart';
import 'package:store_app/widgets/custom_cards.dart';

// ignore: must_be_immutable
class CustomGridWidgets extends StatelessWidget{
   CustomGridWidgets({super.key,required this.categoryname});
  String? categoryname;
  
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
                  child: Padding(
                  padding: const EdgeInsets.only(top: 90.0),
                  child: FutureBuilder<List<Productmodel>>(
                    future: Getallproducts().getproducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                      List<Productmodel> products = snapshot.data!;
                        return GridView.builder(
                          shrinkWrap: true,
                          physics:const  NeverScrollableScrollPhysics(),
                            itemCount: products.length,
                            clipBehavior: Clip.none,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 80,
                              crossAxisSpacing: 10,
                              childAspectRatio: 1.35,
                            ),
                            itemBuilder: (context, index) {
                              return Customcardwidget(product:products[index]);
                            });
                      }
                       else if(snapshot.hasError){
                        return Text('${snapshot.error}');
                      }
                      else{
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ));
  }

 

}