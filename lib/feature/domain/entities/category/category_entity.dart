import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable{
  final int? id;
  final String? categoryName;
  final int? parentId;

  const CategoryEntity(this.id, this.categoryName, this.parentId);

  @override
  List<Object?> get props => [
    id,
    categoryName,
    parentId,
  ];



}