import 'package:storeapp/helper/api.dart';

class AllCategoriesServices {
  Future<List<dynamic>> getallcategories() async {
     List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
          return data;
    
  }
}
