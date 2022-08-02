import 'package:get/state_manager.dart';
import 'package:getx/pages/home/product_model.dart';
import 'package:getx/pages/alert/extensions.dart';
import 'package:getx/services/getProductsApi.dart';

class HomeController extends GetxController {
  var productList = <Product>[].obs;
  var filteredProducts = <Product>[].obs;
  RxList<Product> cartProducts = <Product>[].obs;
  RxInt totalPrice = 0.obs;

  var isLoading = true.obs;
  var tabIndex = 0;
  RxInt productImageDefaultIndex = 0.obs;
  @override
  void onInit() {
    fetchProducts();
    getlikedItems();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();

      if (products != null) {
        productList.value = products;
        filteredProducts.assignAll(productList);
      }
    } finally {
      isLoading(false);
    }
  }

  void addToCart(Product product) {
    product.quantity++;
    cartProducts.add(product);
    cartProducts.assignAll(cartProducts.distinctBy((item) => item));
    calculateTotalPrice();
  }

  void decreaseItem(int index) {
    Product product = cartProducts[index];
    if (product.quantity > 0) {
      product.quantity = product.quantity - 1;
    }
    calculateTotalPrice();
    // cartProducts.refresh();
    update();
  }

  bool isPriceOff(Product product) {
    if (product.off != null) {
      return true;
    } else {
      return false;
    }
  }

  bool get isZeroQuantity {
    return cartProducts.any(
      (element) {
        return element.pPrice.compareTo(0) == 0 ? true : false;
      },
    );
  }

  void calculateTotalPrice() {
    totalPrice.value = 0;
    for (var element in cartProducts) {
      if (isPriceOff(element)) {
        totalPrice.value += element.quantity * element.off;
      } else {
        totalPrice.value += element.quantity * element.pPrice;
      }
    }
  }

  bool get isEmptyCart {
    if (cartProducts.isEmpty || isZeroQuantity) {
      return true;
    } else {
      return false;
    }
  }

  void increaseItem(int index) {
    Product product = cartProducts[index];
    product.quantity++;
    calculateTotalPrice();
    // cartProducts.refresh();
    update();
  }

  void changeIndex(int index) {
    if (index == 0) {
      filteredProducts.assignAll(productList);
    }
    if (index == 1) {
      getlikedItems();
    }
    tabIndex = index;
    update();
  }

  void getlikedItems() {
    filteredProducts
        .assignAll(productList.where((item) => item.isFavorite.value));
  }

  void switchBetweenProductImages(int index) {
    productImageDefaultIndex.value = index;
  }
}
