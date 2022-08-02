// import 'package:GuitarShop/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/pages/home/home_controller.dart';
// import '../../../core/app_color.dart';
import 'package:getx/pages/home/product_model.dart';

import 'package:getx/pages/alert/extensions.dart';
// import '../../../model/product.dart';
import 'package:getx/pages/alert/animated_switcher_wrapper.dart';
import 'package:getx/pages/alert/empty_cart.dart';

final HomeController controller = Get.put(HomeController());

class AlertsPage extends StatelessWidget {
  const AlertsPage({Key? key}) : super(key: key);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0XFFFC6011),
      title: Text(
        "My cart",
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(color: Colors.white),
      ),
    );
  }

  Widget cartListView() {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      itemCount: controller.cartProducts.length,
      itemBuilder: (_, index) {
        Product product = controller.cartProducts[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(15),
          height: 120,
          decoration: BoxDecoration(
              color: Colors.grey[200]?.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorExtension.randomColor),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.pImages[0],
                      // 'asset/images/empty_cart.png',

                      width: 70,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      product.pName.nextLine,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                    // Text(
                    //   controller.getCurrentSize(product),
                    //   style: TextStyle(
                    //       color: Colors.black.withOpacity(0.5),
                    //       fontWeight: FontWeight.w400),
                    // ),
                    // Text(
                    //   controller.isPriceOff(product)
                    //       ? "\$${product.off}"
                    //       : "\$${product.price}",
                    //   style: const TextStyle(
                    //       fontWeight: FontWeight.w900, fontSize: 15),
                    // ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    IconButton(
                      splashRadius: 10.0,
                      onPressed: () => controller.decreaseItem(index),
                      icon: const Icon(
                        Icons.remove,
                        color: Color(0xFFEC6813),
                      ),
                    ),
                    GetBuilder<HomeController>(
                      builder: (HomeController controller) {
                        return AnimatedSwitcherWrapper(
                          child: Text(
                            '${controller.cartProducts[index].quantity}',
                            key: ValueKey<int>(
                                controller.cartProducts[index].quantity),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      splashRadius: 10.0,
                      onPressed: () => controller.increaseItem(index),
                      icon: const Icon(
                        Icons.add,
                        color: Color(0xFFEC6813),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget bottomBarTitle() {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Total",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),
            Obx(() {
              return AnimatedSwitcherWrapper(
                child: Text(
                  "\$${controller.totalPrice.value}",
                  key: ValueKey<int>(controller.totalPrice.value),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 236, 104, 19),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Widget bottomBarButton() {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
          child: ElevatedButton(
            onPressed: controller.isEmptyCart ? null : () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 236, 104, 19)),
            ),
            child: const Text(
              "Buy Now",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 10,
            child: !controller.isEmptyCart ? cartListView() : const EmptyCart(),
          ),
          bottomBarTitle(),
          bottomBarButton()
        ],
      ),
    );
  }
}
