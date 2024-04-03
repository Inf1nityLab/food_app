import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/contants/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<String> names = ['Food', 'Fruits', 'Vegetables', 'Grocery'];

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
      body: Padding(
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
                    const SizedBox(height: 20,),
                    const Text(
                      'Find your food',
                      style: TextStyle(
                          fontSize: 35,
                          color: black,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 20,),
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
                        style: TextButton.styleFrom(
                          shadowColor: white
                        ),
                        child:  Text(
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
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                    child: Text('Grid Item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
