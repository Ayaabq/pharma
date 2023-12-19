class MedicineModel {
  final int category_id;
  final String scientific_name;
  final String commercial_name;
  final String company;
  final int quantity_available;
  var createdat;
  final int cost;

  MedicineModel({
    required this.category_id,
    required this.scientific_name,
    required this.commercial_name,
    required this.company,
    required this.quantity_available,
    required this.createdat,
    required this.cost,
  });

  factory MedicineModel.fromJson(dynamic jsonData) {
    return MedicineModel(
      category_id: jsonData['category_id'],
      scientific_name: jsonData['scientific_name'],
      commercial_name: jsonData['commercial_name'],
      company: jsonData['company'],
      quantity_available: jsonData['quantity_available'],
      createdat: jsonData['createdat'],
      cost: jsonData['cost'],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:pharma/models/category.dart';
//
// class Medicine {
//   const Medicine({
//     required this.id,
//     required this.tjaryName,
//     required this.category,
//   });
//
//   final String id;
//   final String tjaryName;
//   final List<String> category;
// }
