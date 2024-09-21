import 'package:flutter/material.dart';
import 'package:store_app/widgets/custom_grid_widgets.dart';
import 'package:store_app/widgets/custom_list_widgets.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.teal[700]),
        backgroundColor: Colors.blueAccent[100],
        centerTitle: true,
        title:  Text(
          'Category View',
          style: TextStyle(fontWeight: FontWeight.bold,color :Colors.teal[700]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Discover Products',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.list_rounded,
                        size: 30,
                      ))
                ],
              ),
            ),
            const CustomListWidgets(),
            CustomGridWidgets(
              categoryname: '',
            ),
          ],
        ),
      ),
    );
  }
}
