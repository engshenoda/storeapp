import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/update_product_sevices.dart';
import 'package:storeapp/widget/custom_botton.dart';
import 'package:storeapp/widget/custom_text_form_filed.dart';

// ignore: must_be_immutable
class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;
  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'update product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              CustomTextField(
                hintText: 'Product Name',
                obscureText: false,
                onPressed: () {},
                onChanged: (data) {
                  productName = data;
                },
              ),
              CustomTextField(
                hintText: 'describtion',
                obscureText: false,
                onPressed: () {},
                onChanged: (data) {
                  desc = data;
                },
              ),
              CustomTextField(
                hintText: 'price',
                obscureText: false,
                onPressed: () {},
                onChanged: (data) {
                  price = data;
                },
                InputType: TextInputType.number,
              ),
              CustomTextField(
                hintText: 'image',
                obscureText: false,
                onPressed: () {},
                onChanged: (data) {
                  image = data;
                },
              ),
              SizedBox(
                height: 50,
              ),
              CustomBottom(
                color: Colors.green,
                text: 'update',
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  try {
                    await updateProduct(product);
                    print('success');
                  } on Exception catch (e) {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductServices().updateProduct(
      id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        description: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
    isLoading = false;
  }
}
