// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffeeuiapp/util/coffee_tile.dart';
import 'package:coffeeuiapp/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of coffee types
  final List coffeeType = [
    // [coffee type, isSelected]
    ["Cappucino", true],
    ["Latte", false],
    ["Americano", false],
    ["Espresso", false],
    ["Kopiko", false],
  ];

  //userTap on coffee type
  void coffeeTypeSelected(int index) {
    setState(() {
      // this loop for make every selection false
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications')
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffee for you",
              style: GoogleFonts.bebasNeue(
                fontSize: 56,
              ),
            ),
          ),

          //Spacing
          SizedBox(
            height: 25,
          ),

          //Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Find your coffee",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600))),
            ),
          ),

          //Spacing
          SizedBox(
            height: 25,
          ),

          //horizontal listView of coffee types
          Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeType.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                        coffeeType: coffeeType[index][0],
                        isSelected: coffeeType[index][1],
                        onTap: () {
                          coffeeTypeSelected(index);
                        });
                  })),

          //horizontal listView of coffee tiles
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                coffeeImagePath: "lib/images/latte.png",
                coffeeName: "Latte",
                coffeePrice: "4.20",
              ),
              CoffeeTile(
                coffeeImagePath: "lib/images/americano.png",
                coffeeName: "Cappucino",
                coffeePrice: "10.0",
              ),
              CoffeeTile(
                coffeeImagePath: "lib/images/capucino.png",
                coffeeName: "Americano",
                coffeePrice: "3.20",
              ),
              CoffeeTile(
                coffeeImagePath: "lib/images/latte.png",
                coffeeName: "Espresso",
                coffeePrice: "9.90",
              ),
            ],
          ))
        ],
      ),
    );
  }
}
