import 'package:get/get.dart';

import '../model/detail_class.dart';

class ThemeController extends GetxController {
  RxBool isDark = false.obs;

  changeTheme() {
    isDark.value = !isDark.value;
  }
}

class CounterController extends GetxController {
  RxInt val = 0.obs;

  List<Detail> myProduct = [
    Detail(
      img: "images/i1.png",
      name: "CREEPERS plant",
      price: 500,
      like: false.obs,
      cart: false.obs,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      count: 1.obs,
    ),
    Detail(
      img: "images/i2.png",
      name: "WILD plant",
      price: 300,
      like: false.obs,
      cart: false.obs,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      count: 1.obs,
    ),
    Detail(
      img: "images/i3.png",
      name: "THISTLE plant",
      price: 200,
      like: false.obs,
      cart: false.obs,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      count: 1.obs,
    ),
    Detail(
      img: "images/i4.png",
      name: "CLIMBERS plant",
      price: 150,
      like: false.obs,
      cart: false.obs,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      count: 1.obs,
    ),
    Detail(
      img: "images/i5.png",
      name: "SHRUBS plant",
      price: 350,
      like: false.obs,
      cart: false.obs,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      count: 1.obs,
    ),
    Detail(
      img: "images/i6.png",
      name: "HERBS plant",
      price: 450,
      like: false.obs,
      cart: false.obs,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      count: 1.obs,
    ),
  ];

  RxList<Detail> likeProduct = <Detail>[].obs;
  List<Detail> cartProduct = <Detail>[].obs;

  void like({required int e}) {
    myProduct[e].like.value = !myProduct[e].like.value;
    (myProduct[e].like.value == true)
        ? likeProduct.add(myProduct[e])
        : likeProduct.remove(myProduct[e]);
  }

  void cart({required int e}) {
    myProduct[e].cart.value = !myProduct[e].cart.value;
    (myProduct[e].cart.value == true)
        ? cartProduct.add(myProduct[e])
        : cartProduct.remove(myProduct[e]);
  }

  void likeRemove({required int e}) {
    likeProduct[e].like.value = !likeProduct[e].like.value;
    (likeProduct[e].like.value == false)
        ? likeProduct.remove(likeProduct[e])
        : null;
  }

  void cartRemove({required int e}) {
    cartProduct[e].cart.value = !cartProduct[e].cart.value;
    (cartProduct[e].cart.value == false)
        ? cartProduct.remove(cartProduct[e])
        : null;
  }

  void increment({required int e}) {
    cartProduct[e].count += 1;
  }

  void decrement({required int e}) {
    if (cartProduct[e].count > 1) {
      cartProduct[e].count -= 1;
    }
  }

  void priceCounter() {
    val.value = 0;
    for (int i = 0; i < cartProduct.length; i++) {
      if (cartProduct[i].count.value <= 1) {
        val += cartProduct[i].price;
      } else {
        val += (cartProduct[i].price * cartProduct[i].count.value);
      }
    }
  }
}
