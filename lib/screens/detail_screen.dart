import 'package:flutter/material.dart';
import 'package:food_app/model/food_model.dart';

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
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        backgroundColor: green,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const GlassContainerWidget(
            iconData: Icons.arrow_back_ios,
            left: 10,
          ),
        ),
        actions: const [
          GlassContainerWidget(
            iconData: Icons.favorite_border_sharp,
            left: 0,
          ),
          SizedBox(
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
                  )
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:  EdgeInsets.only(top: height * 0.07),
              child: CircleAvatar(
                radius: height * 0.15,
                backgroundImage:  NetworkImage('${widget.food.picture}'),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: height * 0.4, left: 10, right: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.food.name, style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                        Text('${widget.food.price}', style: TextStyle(
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
                          IconButton(onPressed: (){}, icon: const Icon(Icons.remove, color: white,)),
                          const Text('1', style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: white)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.add, color: white,))
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconTextWidget(iconData: Icons.star, text: '${widget.food.value}', color: Colors.orangeAccent,),
                    IconTextWidget(iconData: Icons.fastfood, text: widget.food.kcal, color: Colors.red,),
                    IconTextWidget(iconData: Icons.watch_later, text: widget.food.time, color: Colors.orangeAccent,),
                  ],
                ),
                const SizedBox(height: 30,),
              ],
            ),
          )
        ],
      ),
    );
  }


}
