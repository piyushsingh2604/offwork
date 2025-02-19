import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Track the selected index
  int? selectedIndex;

  final List<String> testList = ["hi", "Hellow", "testing", "appv bfgvcb vc "];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          Container(
            height: 50, // Adjusted height for better appearance
            width: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: testList.length,
              itemBuilder: (context, index) {
                // Determine color based on whether it's selected
                Color itemColor =
                    selectedIndex == index ? Colors.yellow : Colors.green;

                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // Update the selected index
                      });
                    },
                    child: Container(
                      height: 40, // Adjusted height for better appearance
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: itemColor, // Apply color based on selection
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Center(
                          child: Text(
                            testList[index],
                            style: TextStyle(
                              color:
                                  selectedIndex == index
                                      ? Colors.black
                                      : Colors.white,
                            ), // Adjust text color for better contrast
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
