// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/pages/home/home_controller.dart';
// import 'package:getx_app/routes/app_routes.dart';

// import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:get/get.dart'; //Obx
// import 'package:get/instance_manager.dart';
// import 'package:shopx/controllers/productcontroller.dart';
import 'package:getx/pages/home/product_tile.dart';
import 'open_container.dart';
import 'package:getx/pages/home/product_model.dart';
import 'package:getx/style/style.dart';
import 'package:getx/pages/home/color_data.dart';

class HomePage extends StatelessWidget {
  final HomeController productController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFFC6011),
        title: Text(
          "WELCOME TO GUITAR SHOP ",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 170,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: AppData.recommendedProducts.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      width: 375,
                      decoration: BoxDecoration(
                        color: AppData
                            .recommendedProducts[index].cardBackgroundColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Big Saving Upto \n 30% off',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: AppData.recommendedProducts[index]
                                        .buttonBackgroundColor,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  child: Text(
                                    "Buy Now",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppData
                                            .recommendedProducts[index]
                                            .buttonTextColor!),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            'asset/images/shopping.png',
                            height: 125,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                // ignore: curly_braces_in_flow_control_structures
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: productController.filteredProducts.length,
                  crossAxisSpacing: 16, //horizontal spacing
                  mainAxisSpacing: 16, //vertical ---- spacing
                  itemBuilder: (context, index) {
                    Product product = productController.filteredProducts[index];
                    // return ProductTile(
                    //     productController.filteredProducts[index]);
                    return OpenContainerWrapper(
                        product: product,
                        child: ProductTile(
                            productController.filteredProducts[index]));
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                );
            }),
          )
        ],
      ),
    );
  }
}
