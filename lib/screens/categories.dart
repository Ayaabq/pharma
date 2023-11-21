import 'package:flutter/material.dart';
import 'package:pharma/data/dummy_data_category.dart';
import 'package:pharma/data/dummy_data_medicine.dart';
import 'package:pharma/models/category.dart';
import 'package:pharma/screens/medicines.dart';
import 'package:pharma/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMedicine = dummyMedicine
        .where(
          (medicine) => medicine.category.contains(category.id),
        )
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MedicinesScreen(
          title: category.title,
          medicines: filteredMedicine,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectedCategory: () {
                  _selectCategory(
                    context,
                    category,
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
