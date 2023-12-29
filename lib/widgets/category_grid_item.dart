import 'package:flutter/material.dart';
import 'package:pharma/models/category.dart';
import 'package:pharma/models/category/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  CategoryGridItem({
    required this.category,
    super.key,
    //required this.category,
    required this.onSelectedCategory,
  });

  CategoryModel category;
  //final Category category;
  final Function(int id) onSelectedCategory;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsetsDirectional.symmetric(vertical: 7),
        color: Color.fromARGB(255, 169, 225, 225),
        child: InkWell(
          onTap: () {
            onSelectedCategory(category.id);
          },
          //splashColor: category.color,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(

                maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                category.name.toString(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,

                      //color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
          ),
        ));
  }
}
