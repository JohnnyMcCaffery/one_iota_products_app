
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String id;
  @JsonKey(name: 'SKU')
  final String sku;
  final String name;
  @JsonKey(defaultValue: '')
  final String brandName;
  final String mainImage;
  final Map<dynamic, dynamic> price;
  final List<dynamic> sizes;
  final String stockStatus;
  final String colour;
  final String description;

  const Product({
    required this.id,
    required this.sku,
    required this.name,
    required this.brandName,
    required this.mainImage,
    required this.price,
    required this.sizes,
    required this.stockStatus,
    required this.colour,
    required this.description
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
    _$ProductFromJson(json);
}