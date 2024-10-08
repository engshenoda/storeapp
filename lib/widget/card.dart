import 'package:flutter/material.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/pages/update_product_page.dart';

class MyCard extends StatelessWidget {
   MyCard({super.key, required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 40,
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              offset: Offset(10, 10),
            )
          ]),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);
            },
            child: Card(
              elevation: 8,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0, 12),
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${product.price.toString()}',
                        ),
                        Icon(Icons.favorite_border),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 40,
          top: -50,
          child: Image.network(
            product.image,
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }
}
