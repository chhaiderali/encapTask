import '../../model/home/home_list.dart';

abstract class HomeRepository {
  Future<List<Product>> fetchProductList();
}
