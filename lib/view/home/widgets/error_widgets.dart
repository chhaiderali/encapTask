import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../configs/components/internet_exception_widget.dart';
import '../../../data/response/api_response.dart';
import '../../../view_model/home/home_view_model.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewViewModel>(builder: (context, provider, child) {
      if (provider.productList.message.toString() == 'No Internet Connection') {
        return InterNetExceptionWidget(onPress: () {
          provider.setProductsList(ApiResponse.loading());
          provider.fetchProductsListApi();
        });
      } else {
        return InkWell(
            onTap: () {
              provider.setProductsList(ApiResponse.loading());
              provider.fetchProductsListApi();
            },
            child: Center(child: Text(provider.productList.message.toString())));
      }
    });
  }
}
