// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      sku: json['SKU'] as String,
      name: json['name'] as String,
      brandName: json['brandName'] as String? ?? '',
      mainImage: json['mainImage'] as String,
      price: json['price'] as Map<String, dynamic>,
      sizes: json['sizes'] as List<dynamic>,
      stockStatus: json['stockStatus'] as String,
      colour: json['colour'] as String,
      description: json['description'] as String,
    );
