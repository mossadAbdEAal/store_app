import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/all_products.dart';
import 'package:store_app/services/get_all_products.dart';
import 'package:store_app/views/category_view.dart';
import 'package:store_app/widgets/custom_cards.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  static String id = 'Homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[100],
          elevation: 0,
          title: const Text('New Trend',style: TextStyle(color: Colors.yellowAccent,fontWeight: FontWeight.bold),),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                
                }, icon:const  Padding(
                  padding:  EdgeInsets.only(right: 20.0),
                  child:  Icon(FontAwesomeIcons.cartPlus),
                )),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const Text('Popular Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const  CategoryView();
                    }));
                  }, child: const Text('Categories')),
                  ],),
               ),
              Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 16, top: 90),
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
                  ),
            ],
          ),
        ));
  }
}
