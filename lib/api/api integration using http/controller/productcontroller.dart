import 'package:api_project/api/api%20integration%20using%20http/service/api_service.dart';
import 'package:get/get.dart';

class productcontroller extends GetxController {
  //obs ->observable
  var isLoading = true.obs;
  var productList = [].obs;
  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  void getProduct() async {
    try {
      isLoading(true);
      var products = await httpservice.fetchproducts();
      if (products != null) {
        productList.value = products;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
