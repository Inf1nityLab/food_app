import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/contants/colors.dart';
import 'package:food_app/locator.dart';
import 'package:food_app/screens/detail_screen.dart';
import 'package:food_app/service/service.dart';

import '../model/food_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> names = ['Food', 'Fruits', 'Vegetables', 'Grocery'];

  Future<List<Food>>? _food;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _food = locator<FoodService>().getData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          leading: Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
                color: green, borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: Icon(
                Icons.menu,
                color: white,
                size: 30,
              ),
            ),
          ),
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_on,
                size: 30,
                color: green,
              ),
              Text('Kyrgyzstan')
            ],
          ),
          centerTitle: true,
          actions: [
            Container(
              height: 60,
              width: 60,
              margin: const EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'))),
            ),
          ],
        ),
        body: FutureBuilder(
          future: _food,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 15),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        color: white,
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hi, Baiastan',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: green,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Find your food',
                              style: TextStyle(
                                  fontSize: 35,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                fillColor: Colors.tealAccent,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  size: 30,
                                  color: green,
                                ),
                                hintText: 'Search Food',
                                hintStyle: const TextStyle(
                                  fontSize: 20,
                                  color: grey,
                                ),
                                suffixIcon: Container(
                                  height: 50,
                                  width: 50,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                      color: green,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add_chart,
                                      color: white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: names.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(shadowColor: white),
                                child: Text(
                                  names[index],
                                  style: const TextStyle(
                                      fontSize: 25,
                                      color: green,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SliverGrid(

                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200.0,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 0.7,
                      ),
                      delegate: SliverChildBuilderDelegate(


                            (BuildContext context, int index) {
                          final food = snapshot.data![index];
                          return Container(
                              alignment: Alignment.center,
                              color: Colors.white10,
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  Stack(children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: CircleAvatar(
                                          radius: 65,
                                          backgroundImage:
                                          NetworkImage('${food.picture}'),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 5,
                                      child: IconButton(
                                          onPressed: () {

                                            setState(() {
                                              food.liked = !food.liked;

                                            });
                                            locator<FoodService>().putData(food.liked, food.id, );
                                          },
                                          icon: food.liked? const Icon(
                                            Icons.favorite,
                                            size: 25,
                                            color: Colors.red
                                          ) : const Icon(
                                              Icons.favorite_border_sharp,
                                              size: 25,
                                              color: Colors.grey
                                          ) ),
                                    )
                                  ]),
                                  Text(
                                    '${food.name}',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${food.time} ',
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                      Expanded(child: Container()),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.orangeAccent,
                                        size: 25,
                                      ),
                                      Text(
                                        '${food.value}',
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text(
                                        '${food.price} som',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (
                                                  context) =>  DatScreen(food: food,)));
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(13),
                                                bottomRight: Radius.circular(
                                                    13),
                                              )),
                                          child: const Center(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ));
                        },
                        childCount: snapshot.data!.length,
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
    );
  }
}
