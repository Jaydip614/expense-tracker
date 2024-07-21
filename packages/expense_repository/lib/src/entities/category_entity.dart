
//Entity is used to send and get data from database
class CategoryEntity{
  String categoryID;
  String name;
  int totalExpense;
  String icon;
  String color;

  CategoryEntity({
    required this.categoryID,
    required this.name,
    required this.totalExpense,
    required this.icon,
    required this.color,
  });

  //Convert 'Category Object' to 'Map'
  //To send data to firebase Docs. //which is only receive 'Map'
  Map<String, Object?> toDocument(){
    return {
      'categoryID' : categoryID,
      'name' : name,
      'totalExpense' : totalExpense,
      'icon' : icon,
      'color' : color,
    };
  }

  //convert 'Map' to 'Category Object'
  //Receive data form firebase. //store it in Category object
  static CategoryEntity fromDocument(Map<String, dynamic> doc){
    return CategoryEntity(
        categoryID: doc['categoryID'],
        name: doc['name'],
        totalExpense: doc['totalExpense'],
        icon: doc['icon'],
        color: doc['color'],
    );
  }
}