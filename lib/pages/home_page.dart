import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/get_all_product_services.dart';
import 'package:storeapp/widget/card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('New Trend'),
        centerTitle: true,
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                onPressed: () {
                  // do something
                },
              ),
            ],
          )
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 70),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductServices().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;

              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 90,
                ),
                itemBuilder: (context, index) {
                  return MyCard(product: products[index],);
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
