import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/util/coffee_tile.dart';
import 'package:testproject/util/coffee_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of coffee types
  final List coffeeType = [
    // ['Coffee Type', status]
    ['Cappucino', false],
    ['Latte', false],
    ['American', false],
    ['Espresso', false],
  ];

  //user tapped on coffee type
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int buttonIndex = 0;
          buttonIndex < coffeeType.length;
          buttonIndex++) {
        if (buttonIndex == index) {
          coffeeType[buttonIndex][1] = true;
        } else {
          coffeeType[buttonIndex][1] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      //appBar specifications
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),

      //bottomNavigationBar specifications
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffee for you",
              style: GoogleFonts.bebasNeue(
                fontSize: 60,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search your blend..',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          //horizontal list of coffe types
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
              },
            ),
          ),

          //horizontal list of coffee tiles
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                cofeeImagePath: 'lib/images/Image1.jpg',
                coffeeName: 'Cappucino',
                coffeePrice: '4.99',
              ),
              CoffeeTile(
                cofeeImagePath: 'lib/images/Image1.jpg',
                coffeeName: 'Cappucino',
                coffeePrice: '5.99',
              ),
              CoffeeTile(
                cofeeImagePath: 'lib/images/Image1.jpg',
                coffeeName: 'Cappucino',
                coffeePrice: '2.99',
              ),
            ],
          )),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
