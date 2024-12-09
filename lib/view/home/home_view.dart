import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../configs/components/loading_widget.dart';
import '../../configs/components/network_image_widget.dart';
import '../../data/response/status.dart';
import '../../main.dart';
import '../../view_model/home/home_view_model.dart';

import '../cart/cart_view.dart';
import 'home_detailed_view.dart';
import 'widgets/error_widgets.dart';
import 'widgets/logout_button_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text('MakeUp List'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(isListView ? Icons.grid_view : Icons.list),
            onPressed: () {
              setState(() {
                isListView = !isListView;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => HomeViewViewModel(homeRepository: getIt())..fetchProductsListApi(),
        child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
          switch (value.productList.status) {
            case Status.loading:
              return const Center(child: LoadingWidget());
            case Status.error:
              return const HomeErrorWidget();
            case Status.completed:
              if (value.productList.data!.isEmpty) {
                return const Center(child: Text('No data found'));
              }
              return isListView
                  ? ListView.builder(
                      itemCount: value.productList.data!.length,
                      itemBuilder: (context, index) {
                        final productList = value.productList.data![index];
                        return Card(
                          child: ListTile(
                            leading: NetworkImageWidget(
                              borderRadius: 5,
                              imageUrl: productList.imageUrl.toString(),
                            ),
                            title: Text(productList.name.toString()),
                            trailing: Text('\$${productList.price.toString()}', textAlign: TextAlign.left),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(product: productList),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    )
                  : GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 4 / 4,
                      ),
                      itemCount: value.productList.data!.length,
                      itemBuilder: (context, index) {
                        final productList = value.productList.data![index];
                        return Card(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(product: productList),
                                ),
                              );
                            },
                            child: GridTile(
                              header: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(productList.name.toString(), textAlign: TextAlign.center),
                              ),
                              footer: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text('\$${productList.price.toString()}', textAlign: TextAlign.center),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: NetworkImageWidget(
                                  borderRadius: 12,
                                  imageUrl: productList.imageUrl.toString(),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
            default:
              return Container();
          }
        }),
      ),
    );
  }
}
