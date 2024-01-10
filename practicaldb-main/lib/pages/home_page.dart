import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooping_app/DBHelper/db_helper.dart';
import 'package:shooping_app/model/detail_class.dart';
import 'package:shooping_app/provider/providerclass.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CounterController counterController = Get.put(CounterController());

  late Future<List<Product>> fetchData;
  Random r = Random();

  @override
  void initState() {
    super.initState();
    addProduct();
    fetchData = Helper.helper.showData();
  }

  int n = 0;
  int j = 30;
  addProduct() async {
    // await Helper.helper.deleteData();
    for (int i = 0; i < 5; i++) {
      await Helper.helper.insertRaw(data: product[i]);
    }
    n = r.nextInt(4);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (j != 0) {
          j--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offNamedUntil("/", (route) => false);
          },
          icon: Icon(
            Icons.refresh,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed("like_page");
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.redAccent,
              )),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Get.toNamed("cart_page");
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Theme.of(context).iconTheme.color,
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.red,
                  child: Obx(
                    () => Text(
                      counterController.cartProduct.length.toString(),
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What plant are you \n looking for?",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).iconTheme.color),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Name,difficulty,room,etc...",
                      hintStyle: TextStyle(color: Theme.of(context).hintColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Categories",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).iconTheme.color),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/1.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60),
                            bottomLeft: Radius.circular(60)),
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        width: 120,
                        child: Text(
                          "Easy indoor plants",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/2.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60)),
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        width: 120,
                        child: Text(
                          "Animal friendly plants",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/3.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60)),
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        width: 120,
                        child: Text(
                          "Popular plants",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/4.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60),
                            bottomLeft: Radius.circular(60)),
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        width: 120,
                        child: Text(
                          "Low light plants",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Theme.of(context).iconTheme.color!),
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                child: FutureBuilder(
                  future: fetchData,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      List<Product> val = snapshot.data;
                      return Row(
                        children: [
                          Container(
                            width: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("images/i${n + 1}.png"),
                              fit: BoxFit.cover,
                            )),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    val[n].name!,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Theme.of(context).cardColor),
                                  ),
                                  const SizedBox(width: 40),
                                  Text(
                                    "Time:- $j",
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 170,
                                child: Text(
                                  val[n].description!,
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
                                    "RS:- ${val[n].price! ~/ 2}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      (j != 0) ? "Buy Now" : "Out Of Stock",
                                      style: TextStyle(
                                          color: (j != 0)
                                              ? Colors.white
                                              : Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Highly Recommended",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).iconTheme.color),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: counterController.myProduct
                    .map(
                      (e) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Theme.of(context).iconTheme.color!),
                          color: Theme.of(context).secondaryHeaderColor,
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
                                Text(
                                  e.name!,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context).cardColor),
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
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    Obx(
                                      () => IconButton(
                                        onPressed: () {
                                          counterController.like(
                                              e: counterController.myProduct
                                                  .indexOf(e));
                                        },
                                        icon: (counterController
                                                .myProduct[counterController
                                                    .myProduct
                                                    .indexOf(e)]
                                                .like
                                                .value)
                                            ? const Icon(Icons.favorite)
                                            : const Icon(Icons.favorite_border),
                                        color: Colors.red,
                                      ),
                                    ),
                                    Obx(
                                      () => IconButton(
                                        onPressed: () {
                                          counterController.cart(
                                              e: counterController.myProduct
                                                  .indexOf(e));
                                          counterController.priceCounter();
                                        },
                                        icon: (counterController
                                                .myProduct[counterController
                                                    .myProduct
                                                    .indexOf(e)]
                                                .cart
                                                .value)
                                            ? const Icon(
                                                Icons.remove_shopping_cart)
                                            : const Icon(
                                                Icons.shopping_cart_outlined),
                                        color: Theme.of(context).cardColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
