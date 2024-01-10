import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../provider/providerclass.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Obx(
                () => Text(
                  "RS:- ${counterController.val.value}",
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Obx(
            () => Column(
              children: counterController.cartProduct
                  .map((e) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Theme.of(context).iconTheme.color!),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(e.img!),
                                fit: BoxFit.cover,
                              )),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 29,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      e.name!,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Theme.of(context).cardColor),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        counterController.cartRemove(
                                            e: counterController.cartProduct
                                                .indexOf(e));
                                        counterController.priceCounter();
                                      },
                                      icon: (counterController
                                              .cartProduct[counterController
                                                  .cartProduct
                                                  .indexOf(e)]
                                              .cart
                                              .value)
                                          ? const Icon(
                                              Icons.remove_shopping_cart)
                                          : const Icon(
                                              Icons.shopping_cart_outlined),
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 170,
                                  child: Text(
                                    e.description!,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "RS:- ${e.price}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              counterController.decrement(
                                                  e: counterController
                                                      .cartProduct
                                                      .indexOf(e));
                                              counterController.priceCounter();
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color:
                                                  Theme.of(context).cardColor,
                                            )),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Container(
                                            height: 30,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.grey.shade200),
                                            alignment: Alignment.center,
                                            child: Text(
                                                "${counterController.cartProduct[counterController.cartProduct.indexOf(e)].count.value}")),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              counterController.increment(
                                                  e: counterController
                                                      .cartProduct
                                                      .indexOf(e));
                                              counterController.priceCounter();
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color:
                                                  Theme.of(context).cardColor,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
