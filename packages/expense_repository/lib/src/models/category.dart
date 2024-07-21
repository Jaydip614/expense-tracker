import '../entities/entities.dart';

//Models is used for Application data
class Category{
  String categoryID;
  String name;
  int totalExpense;
  String icon;
  String color;

  Category({
    required this.categoryID,
    required this.name,
    required this.totalExpense,
    required this.icon,
    required this.color,
  });

  //empty object
  static final empty = Category(
      categoryID: '',
      name: '',
      totalExpense: 0,
      icon: '',
      color: '',
  );

  //convert 'Category' class to 'CategoryEntity' class //send data to firebase
  CategoryEntity toEntity(){
    return CategoryEntity(
        categoryID: categoryID,
        name: name,
        totalExpense: totalExpense,
        icon: icon,
        color: color,
    );
  }

  //convert 'CategoryEntity' class to 'Category' class //get data from firebase
  static Category fromEntity(CategoryEntity entity){
    return Category(
        categoryID: entity.categoryID,
        name: entity.name,
        totalExpense: entity.totalExpense,
        icon: entity.icon,
        color: entity.color,
    );
  }
}