import 'package:flutter/material.dart';
import 'package:pharma/models/category.dart';
import 'package:pharma/models/category/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  CategoryGridItem({
    required this.category,
    super.key,
    //required this.category,
    //required this.onSelectedCategory,
  });

  CategoryModel category;
  //final Category category;
  //final Function() onSelectedCategory;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsetsDirectional.symmetric(vertical: 7),
        color: Colors.greenAccent[100],
        child: InkWell(
          onTap: () {
            //onSelectedCategory();
          },
          //splashColor: category.color,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 34,
            ),
            child: Text(
              category.name.toString(),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                    //color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
        ));
  }
}
