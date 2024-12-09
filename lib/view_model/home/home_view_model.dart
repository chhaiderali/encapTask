import 'package:encaptask/model/home/home_list.dart';
import 'package:flutter/foundation.dart';

import '../../data/response/api_response.dart';
import '../../repository/home_api/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  HomeRepository homeRepository;
  HomeViewViewModel({required this.homeRepository});

  ApiResponse<List<Product>> productList = ApiResponse.loading();

  setProductsList(ApiResponse<List<Product>> response) {
    productList = response;
    notifyListeners();
  }

  Future<void> fetchProductsListApi() async {
    setProductsList(ApiResponse.loading());

    homeRepository.fetchProductList().then((value) {
      print(value);
      setProductsList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setProductsList(ApiResponse.error(error.toString()));
    });
  }
}
