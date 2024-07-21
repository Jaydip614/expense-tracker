part of 'create_category_bloc.dart';

// @immutable
sealed class CreateCategoryEvent extends Equatable{

  @override
  List<Object> get props => [];
}

class CreateCategory extends CreateCategoryEvent{
  final Category category;

  CreateCategory(this.category);

  @override
  List<Object> get props => [category];
}