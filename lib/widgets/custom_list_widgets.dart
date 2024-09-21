import 'package:flutter/material.dart';
import 'package:store_app/services/get_all_categories_service.dart';
import 'package:store_app/views/category_view_details.dart';

class CustomListWidgets extends StatelessWidget{
  const CustomListWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child:FutureBuilder(
                    future: Getallcategories().getallcategories(),
                          builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        dynamic categories = snapshot.data!;
                        return Container(
                        height: 40,
                        decoration: const BoxDecoration(),
                        child:   ListView.builder(
                          itemCount: categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return CategoryViewDetails(categoryname: categories[index]); 
                              }));
                               
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 0, bottom: 0),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 245, 231, 231),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: Center(
                                  child: Text(
                                    categories[index],
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            );
                          }),
                      );
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
                );
  }
  
}

 