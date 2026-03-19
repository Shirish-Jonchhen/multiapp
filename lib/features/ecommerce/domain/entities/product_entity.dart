class ProductEntity {
  final int id;
  final String title;
  final String description;
  final double price;
  final double ratingRate;
  final int ratingCount;
  final String image;
  final String category;
  final bool isFavorite;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.ratingRate,
    required this.ratingCount,
    required this.image,
    required this.category,
    required this.isFavorite,
  });

  ProductEntity copyWith({bool? isFavorite}) => ProductEntity(
        id: id,
        title: title,
        description: description,
        price: price,
        ratingRate: ratingRate,
        ratingCount: ratingCount,
        image: image,
        category: category,
        isFavorite: isFavorite ?? this.isFavorite,
      );
}
