import 'package:flutter/material.dart';
import 'package:food_app/model/food_model.dart';
import 'package:food_app/widgets/elevated_button_widget.dart';

import '../contants/colors.dart';
import '../widgets/glass_container_widget.dart';
import '../widgets/iconTextWidget.dart';

class DatScreen extends StatefulWidget {
  final Food food;

  const DatScreen({super.key, required this.food});

  @override
  State<DatScreen> createState() => _DatScreenState();
}

class _DatScreenState extends State<DatScreen> {
  int line = 3;
  bool a = false;
  int count = 1;


  void countIncrement(){
    setState(() {
      count+=1;
    });
  }

  void countDecrement(){
    if(count > 1){
      setState(() {
        count-=1;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        backgroundColor: green,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const GlassContainerWidget(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: grey,
            ),
            left: 10,
          ),
        ),
        actions: [
          GlassContainerWidget(
            icon: widget.food.liked
                ? const Icon(
                    Icons.favorite,
                    size: 25,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.favorite_border_sharp,
                    size: 25,
                    color: grey,
                  ),
            left: 0,
          ),
          const SizedBox(
            width: 10,
          )
        ],
        title: const Text('Food details',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.7,
              decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.07),
              child: CircleAvatar(
                radius: height * 0.15,
                backgroundImage: NetworkImage('${widget.food.picture}'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.4, left: 10, right: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.food.name,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Text('${widget.food.price}',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green))
                      ],
                    ),
                    Container(
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                countDecrement();
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: white,
                              )),
                           Text('$count',
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: white)),
                          IconButton(
                              onPressed: () {
                                countIncrement();
                              },
                              icon: const Icon(
                                Icons.add,
                                color: white,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconTextWidget(
                      iconData: Icons.star,
                      text: '${widget.food.value}',
                      color: Colors.orangeAccent,
                    ),
                    IconTextWidget(
                      iconData: Icons.fastfood,
                      text: widget.food.kcal,
                      color: Colors.red,
                    ),
                    IconTextWidget(
                      iconData: Icons.watch_later,
                      text: widget.food.time,
                      color: Colors.orangeAccent,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: height * 0.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'На нашем образовательном сайте вы легко найдете море полезного и '
                        'увлекательного материала для изучения английского языка, а также для его'
                        ' преподавания. ',
                        maxLines: line,
                        overflow: TextOverflow.ellipsis,
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              if (line == 3) {
                                setState(() {
                                  line += 3;
                                  a = true;
                                });
                              } else {
                                line = 3;
                                a = false;
                              }
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('read more'),
                              a
                                  ? const Icon(Icons.arrow_drop_up)
                                  : const Icon(Icons.arrow_drop_down_sharp),
                            ],
                          ))
                    ],
                  ),
                ),
                ElevatedButtonWidget(
                    backColor: green,
                    textColor: white,
                    onPressed: () {},
                    text: 'Add to cart')
              ],
            ),
          )
        ],
      ),
    );
  }
}
