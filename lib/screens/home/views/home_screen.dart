import 'dart:math';
import 'package:expense_repository/expense_repository.dart';
import 'package:expenses_tracker/screens/add_expense/blocs/create_category_bloc/create_category_bloc.dart';
import 'package:expenses_tracker/screens/add_expense/view/add_expense.dart';
import 'package:expenses_tracker/screens/home/views/main_screen.dart';
import 'package:expenses_tracker/screens/stats/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int index = 0;
  Color selectedColor = Colors.blue;
  Color unSelectedColor = Colors.grey.shade400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: index == 0 ? const MainScreen() : const StatsScreen(),
      bottomNavigationBar:
      Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: const Border.fromBorderSide(BorderSide.none),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Theme.of(context).colorScheme.surface,
              offset: const Offset(0, -2)
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30)
          ),
          child:
          BottomNavigationBar(
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            backgroundColor: Colors.white,
            elevation: 2,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            iconSize: 30,
            currentIndex: index,
            selectedItemColor: selectedColor,
            unselectedItemColor: unSelectedColor,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
            ),

            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view_rounded,),
                  label: "Overview",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart,),
                  label: "Stats"
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context2) => BlocProvider(
                  create: (context) => CreateCategoryBloc(
                    FirebaseExpenseRepo(),
                  ),
                  child: const AddExpense(),
                  ),
                ),
            );
          },
          shape: const CircleBorder(),
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.tertiary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.primary,
                ],
                transform: const GradientRotation(pi / 4),
              )
            ),
            child: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
