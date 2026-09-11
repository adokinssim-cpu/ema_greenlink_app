class Product {
  final String id;
  final String nameEn;
  final String nameFr;
  final String descriptionEn;
  final String descriptionFr;
  final double price;
  final String category;
  final String imageUrl;
  final int stock;

  const Product({
    required this.id,
    required this.nameEn,
    required this.nameFr,
    required this.descriptionEn,
    required this.descriptionFr,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.stock,
  });

  String getName(String locale) => locale == 'fr' ? nameFr : nameEn;
  String getDescription(String locale) =>
      locale == 'fr' ? descriptionFr : descriptionEn;
}
