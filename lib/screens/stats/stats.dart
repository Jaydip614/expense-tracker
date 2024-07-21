import 'dart:math';
import 'package:expenses_tracker/screens/stats/chart.dart';
import 'package:flutter/material.dart';
import '../home/views/main_screen.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transactions",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.tune),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const ToggleButtons(),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 7,),
                      const Text("01 Jan 2024 - 01 April 2024",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Text("\$3500.00",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 17,),
                      SizedBox(
                        width: screenWidth,
                        height: screenWidth / 1.6,
                        child: const TransactionChart(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Text("Top Expenses",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 20,),
              const TransactionList(),
            ],
          ),
        ),
    );
  }
}

class ToggleButtons extends StatefulWidget {
  const ToggleButtons({super.key});

  @override
  State<ToggleButtons> createState() => _ToggleButtonsState();
}

class _ToggleButtonsState extends State<ToggleButtons> {

  bool isPressed = false;
  int selectedButton = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: isPressed == true ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: Container(
                width: MediaQuery.of(context).size.width / 2.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).colorScheme.tertiary,
                      ],
                      transform: const GradientRotation(pi / 4),
                    )
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      if(selectedButton == 2){
                        setState(() {
                          isPressed = !isPressed;
                          selectedButton = 1;
                        });
                      }
                    },
                    child: Center(
                      child: Text("Income",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: isPressed == true ? Colors.white : Colors.black,
                        ),),
                    ),
                  ),
                ),
                const SizedBox(width: 50,),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      if(selectedButton == 1){
                        setState(() {
                          isPressed = !isPressed;
                          selectedButton = 2;
                        });
                      }
                    },
                    child: Center(
                      child: Text("Expenses",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: isPressed == true ? Colors.black : Colors.white,
                          ),),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

