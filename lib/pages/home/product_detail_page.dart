// import 'package:GuitarShop/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:getx/pages/home/home_controller.dart';
// import '../../../core/app_color.dart';
import 'package:getx/pages/home/product_model.dart';

final HomeController controller = Get.put(HomeController());

class ProductDetailScreen extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  final Product product;

  ProductDetailScreen(this.product, {Key? key}) : super(key: key);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          controller.productImageDefaultIndex.value = 0;
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget productPageView(double width, double height) {
    return Container(
      height: height * 0.42,
      width: width,
      decoration: const BoxDecoration(
        color: Color(0xFFE5E6E8),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(200),
          bottomLeft: Radius.circular(200),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.32,
            child: PageView.builder(
              // itemCount: product.images.length,
              itemCount: product.pImages.length,
              controller: _pageController,
              onPageChanged: controller.switchBetweenProductImages,
              itemBuilder: (_, index) {
                return FittedBox(
                  fit: BoxFit.none,
                  child: Image.network(
                    product.pImages[index],
                    scale: 1,
                  ),
                );
              },
            ),
          ),
          Obx(
            () => SmoothIndicator(
                effect: const WormEffect(
                    dotColor: Colors.white, activeDotColor: Color(0xFFEC6813)),
                // ),
                offset: controller.productImageDefaultIndex.value.toDouble(),
                count: product.pImages.length),
          )
        ],
      ),
    );
  }

  Widget _ratingBar(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
            initialRating: product.rating,
            direction: Axis.horizontal,
            itemBuilder: (_, index) {
              return const Icon(Icons.star, color: Color(0XFFFC6011));
            },
            onRatingUpdate: (rating) {}),
        const SizedBox(width: 30),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              productPageView(width, height),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.pName,
                      style: const TextStyle(
                        color: Color(0XFFFC6011),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _ratingBar(context),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          product.off != null
                              ? "\$${product.off}"
                              : "\$${product.pPrice}",
                          //   style: const TextStyle(
                          style: const TextStyle(
                            color: Color(0XFFFC6011),
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 3),
                        Visibility(
                          visible: product.off != null ? true : false,
                          child: Text(
                            "\$${product.pPrice}",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Spacer(),
                        // ignore: prefer_const_constructors
                        Text(
                          // product.isAvailable
                          //     ? "Available in stock"
                          //     : "Not available",
                          "Available in stock",
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "About",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 10),
                    Text(product.pDescription),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: product.isAvailable
                            ? () => controller.addToCart(product)
                            // ? () => {}
                            : null,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 236, 104, 19)),
                        ),
                        child: const Text(
                          "Add to cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
