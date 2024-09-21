
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store_app/models/all_products.dart';
import 'package:store_app/services/catigories_service.dart';
import 'package:store_app/widgets/custom_cards.dart';

// ignore: must_be_immutable
class CategoryViewDetails extends StatelessWidget {
  CategoryViewDetails({super.key, required this.categoryname});
  String? categoryname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color:Colors.teal[700] ),
        backgroundColor: Colors.blueAccent[100],
        title: Text(
          '$categoryname',
          style:  TextStyle(fontWeight: FontWeight.bold,color: Colors.teal[700]),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: FutureBuilder<List<Productmodel>>(
          future: Categoriesservice().getcategories(categoryname: categoryname!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
             List<Productmodel> products = snapshot.data!;
              return GridView.builder(
        
                  physics:const BouncingScrollPhysics(),
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 80,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.35,
                  ),
                  itemBuilder: (context, index) {
                    return Customcardwidget(product: products[index]);
                  });
            } else if (snapshot.hasError) {
              log('${snapshot.error}');
              return Text('${snapshot.error}scsfdsfds');
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
