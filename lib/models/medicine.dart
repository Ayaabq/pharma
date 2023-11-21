import 'package:flutter/material.dart';
import 'package:pharma/models/category.dart';

class Medicine {
  const Medicine({
    required this.id,
    required this.tjaryName,
    required this.category,
  });

  final String id;
  final String tjaryName;
  final List<String> category;
}
