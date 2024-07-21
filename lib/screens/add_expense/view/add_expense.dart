import 'dart:math';
import 'package:expense_repository/expense_repository.dart';
import 'package:expenses_tracker/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:uuid/uuid.dart';

import '../blocs/create_category_bloc/create_category_bloc.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {

  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    var dateTime = DateTime.now();
    dateController.text = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Add Expense",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  CustomTextField(
                      controller: expenseController,
                      width: screenWidth / 1.5,
                      hintText: '',
                      fillColor: Colors.white,
                      readOnly: false,
                      icon: Icons.attach_money,
                      iconColor: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  const SizedBox(height: 50,),
                  CustomTextField(
                    onTap: () {

                    },
                    onSuffixIconTap: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            bool isExpended = false;
                            IconData? selectedIcon;
                            TextEditingController nameController = TextEditingController();
                            TextEditingController iconController = TextEditingController();
                            TextEditingController colorController = TextEditingController();
                            nameController.text = '';
                            Color selectedColor = Colors.white;
                            bool isLoading = false;

                            return BlocProvider.value(
                              value: context.read<CreateCategoryBloc>(),
                              child: BlocListener<CreateCategoryBloc, CreateCategoryState>(
                                listener: (context, state) {
                                  if(state is CreateCategorySuccess){
                                    Navigator.pop(ctx);
                                  }
                                  else if(state is CreateCategoryLoading){
                                    setState(() {
                                      isLoading = true;
                                    });
                                  }
                                },
                                child: StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      backgroundColor: Theme.of(context).colorScheme.surface,
                                      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text("Create a Category", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                                            const SizedBox(height: 20,),
                                            CustomTextField(
                                              controller: nameController,
                                              width: MediaQuery.of(context).size.width,
                                              hintText: "Name",
                                              onTap: () {
                                                setState(() {
                                                  isExpended = false;
                                                },);
                                              },
                                              icon: selectedIcon ?? selectedIcon,
                                              iconColor: selectedColor == Colors.white ? Colors.black : Colors.black,
                                              fillColor: Colors.white,
                                              borderRadius: BorderRadius.circular(12),
                                              readOnly: false,
                                            ),
                                            const SizedBox(height: 20,),
                                            CustomTextField(
                                              controller: iconController,
                                              onTap: () {
                                                setState(() {
                                                  isExpended = !isExpended;
                                                });
                                              },
                                              width: MediaQuery.of(context).size.width,
                                              hintText: "Icon",
                                              fillColor: Colors.white,
                                              suffixIcon: Icons.keyboard_arrow_down,
                                              borderRadius: BorderRadius.vertical(
                                                top: const Radius.circular(12),
                                                bottom: isExpended ? Radius.zero : const Radius.circular(12),
                                              ),
                                              readOnly: true,
                                            ),
                                            if(isExpended)
                                              Container(
                                                height: 200,
                                                width: MediaQuery.of(context).size.width,
                                                decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.vertical(
                                                        bottom: Radius.circular(12)
                                                    )
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: GridView.builder(
                                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        mainAxisSpacing: 10,
                                                        crossAxisSpacing: 10,
                                                      ),
                                                      itemCount: icons.length,
                                                      itemBuilder: (context, index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedIcon = icons[index];
                                                            },);
                                                          },
                                                          child: Container(
                                                            width: 50,
                                                            height: 50,
                                                            decoration: BoxDecoration(
                                                              border: Border.all(
                                                                width: selectedIcon == icons[index] ? 3 : 1.5,
                                                                color: selectedIcon == icons[index] ? Colors.blue : Colors.grey,
                                                              ),
                                                              borderRadius: BorderRadius.circular(12)
                                                            ),
                                                            child: Icon(
                                                              icons[index],
                                                              size: 45,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                  ),
                                                ),
                                              ),
                                            const SizedBox(height: 20,),
                                            CustomTextField(
                                              onTap: () {
                                                setState(() {
                                                  isExpended = false;
                                                },);
                                                showDialog(
                                                    context: context,
                                                    builder: (contextColor) {
                                                      return AlertDialog(
                                                        content: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            SingleChildScrollView(
                                                              child: ColorPicker(
                                                                onColorChanged: (value){
                                                                  setState(() {
                                                                    selectedColor = value;
                                                                  },);
                                                                },
                                                                pickerColor: Colors.blue,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: double.infinity,
                                                              child: FilledButton(
                                                                  onPressed: () {
                                                                    Navigator.pop(contextColor);
                                                                  },
                                                                  child: const Text("Save"),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                );
                                              },
                                              controller: colorController,
                                              width: MediaQuery.of(context).size.width,
                                              hintText: "Color",
                                              fillColor: selectedColor,
                                              borderRadius: BorderRadius.circular(12),
                                              readOnly: true,
                                            ),
                                            const SizedBox(height: 20,),
                                            SizedBox(
                                              width: double.infinity,
                                              height: 50,
                                              child: isLoading == true ?
                                              const CircularProgressIndicator() :
                                              FilledButton(
                                                onPressed: () {
                                                  //Create category object and pop
                                                  Category category = Category.empty;
                                                  category.categoryID = const Uuid().v1();
                                                  category.name = nameController.text;
                                                  category.icon = selectedIcon.toString();
                                                  category.color = selectedColor.toString();
                                                  context.read<CreateCategoryBloc>().add(CreateCategory(category));
                                                  // Navigator.pop(context);
                                                },
                                                style: FilledButton.styleFrom(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                                ),
                                                child: const Text("Save"),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                ),
                              ),
                            );
                          },
                      );
                    },
                    controller: categoryController,
                    width: screenWidth,
                    hintText: 'Category',
                    fillColor: Colors.white,
                    readOnly: true,
                    icon: Icons.tune,
                    suffixIcon: Icons.add_circle,
                    iconColor: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  const SizedBox(height: 30,),
                  CustomTextField(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          barrierColor: Colors.black38,
                          initialDate: selectedDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                      );

                      if(pickedDate != null){
                        setState(() {
                          dateController.text = '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                          selectedDate = pickedDate;
                        });
                      }
                    },
                    controller: dateController,
                    width: screenWidth,
                    hintText: 'Date',
                    fillColor: Colors.white,
                    readOnly: true,
                    icon: Icons.calendar_month_rounded,
                    iconColor: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                height: kToolbarHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.tertiary,
                    ],
                    transform: const GradientRotation(pi / 4),
                  ),
                ),
                child: InkWell(
                  onTap: (){},
                  child: const Center(
                    child: Text("SAVE",
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 2,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.width,
    required this.hintText,
    this.icon,
    required this.borderRadius,
    this.iconColor,
    this.onTap,
    required this.readOnly,
    required this.controller,
    this.suffixIcon,
    this.onSuffixIconTap,
    required this.fillColor,
  });

  final double width;
  final String hintText;
  final IconData? icon;
  final IconData? suffixIcon;
  final Color? iconColor;
  final Color fillColor;
  final VoidCallback? onTap;
  final VoidCallback? onSuffixIconTap;
  final bool readOnly;
  final TextEditingController controller;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        readOnly: readOnly,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          prefixIcon: Icon(icon,),
          suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: onSuffixIconTap,
          ),
          suffixIconColor: iconColor,
          prefixIconColor: iconColor,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: borderRadius,
          ),
        ),
      ),
    );
  }
}
