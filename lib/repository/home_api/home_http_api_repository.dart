import 'package:encaptask/model/home/home_list.dart';

import '../../configs/app_url.dart';
import '../../data/network/network_api_services.dart';
import 'home_repository.dart';

class HomeHttpApiRepository implements HomeRepository {
  final _apiServices = NetworkApiService();

  @override
  Future<List<Product>> fetchProductList() async {
    dynamic response = await _apiServices.getGetApiResponse(AppUrl.products);
    // return response = Product.fromJson(response);
    return response = (response['products'] as List).map((productJson) => Product.fromJson(productJson)).toList();
  }
}
