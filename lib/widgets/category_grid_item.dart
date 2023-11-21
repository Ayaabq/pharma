import 'package:flutter/material.dart';
import 'package:pharma/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectedCategory,
  });

  final Category category;
  final Function() onSelectedCategory;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsetsDirectional.symmetric(vertical: 7),
        color: Colors.deepPurple[200],
        child: InkWell(
          onTap: () {
            onSelectedCategory();
          },
          splashColor: category.color,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 34,
            ),
            child: Text(
              category.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                    //color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
        ));
  }
}
