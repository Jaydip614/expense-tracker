
//Contains all the method used for backend
//class is abstract, because we are just going to declare the methods
//implementation(define) of all method is done by 'FirebaseExpenseRepo' class

import 'package:expense_repository/src/models/models.dart';

abstract class ExpenseRepository{

  Future<void> createCategory(Category category);

  Future<List<Category>> getCategories();
}