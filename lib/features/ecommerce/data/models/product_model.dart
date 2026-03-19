import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/product_entity.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductRatingModel {
  final double rate;
  final int count;

  const ProductRatingModel({required this.rate, required this.count});

  factory ProductRatingModel.fromJson(Map<String, dynamic> json) =>
      _$ProductRatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRatingModelToJson(this);
}

@JsonSerializable()
class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final ProductRatingModel rating;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  ProductEntity toEntity({bool isFavorite = false}) => ProductEntity(
        id: id,
        title: title,
        description: description,
        price: price,
        ratingRate: rating.rate,
        ratingCount: rating.count,
        image: image,
        category: category,
        isFavorite: isFavorite,
      );
}
