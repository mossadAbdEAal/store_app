import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:store_app/models/all_products.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  ProductDetails({super.key, required this.productmodel});
  Productmodel productmodel;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  double rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.teal[700]),
        backgroundColor: Colors.blueAccent[100],
        title: Text(
          'ID : ${widget.productmodel.id}',
          style:
              TextStyle(color: Colors.teal[700], fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white24),
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Image.network(widget.productmodel.image),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 230),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)),
              color: Colors.indigoAccent[100]),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Category :  ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.productmodel.category,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Title',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.productmodel.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Description',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  maxLines: 3,
                  widget.productmodel.description,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'price : ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          maxLines: 3,
                          r'$',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          maxLines: 3,
                          widget.productmodel.price.toString(),
                          style: const TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'count : ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          maxLines: 3,
                          widget.productmodel.rating.count.toString(),
                          style: const TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'Rating    ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    PannableRatingBar( 
                      rate: widget.productmodel.rating.rate.toDouble() ,
                      items: List.generate(
                          5,
                          (index) => const RatingWidget(
                                selectedColor: Colors.yellow,
                                unSelectedColor: Colors.white,
                                child: Icon(
                                  Icons.star,
                                  size: 30,
                                ),
                              )),
                      onChanged: (value) {
                        // the rating value is updated on tap or drag.
                        setState(() {
                          rating = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration:const  BoxDecoration(),
                  height: 45,
                  width: double.infinity,
                  child: TextButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Colors.redAccent)),
                      onPressed: () async {},
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                            ),
                      )),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
