import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/data/dummy_data_category.dart';
import 'package:pharma/data/dummy_data_medicine.dart';
import 'package:pharma/models/category.dart';

import 'package:pharma/models/category/category_model.dart';
import 'package:pharma/providers/auth_data_provider.dart';
import 'package:pharma/providers/user_provider.dart';
import 'package:pharma/screens/medicines.dart';
import 'package:pharma/services/get_categories_service.dart';
import 'package:pharma/widgets/category_grid_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pharma/widgets/side_drawer/main_drawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_controller.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key});

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
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

  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    'assets/images/second_med.jpg',

    'assets/images/third_screen.jpg',
    'assets/images/digital_health.jpg',

    // 'https://images.unsplash.com/photo-1612825173281-9a193378527e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=499&q=80',
    // 'https://images.unsplash.com/photo-1580654712603-eb43273aff33?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    // 'https://images.unsplash.com/photo-1627916607164-7b20241db935?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
    // 'https://images.unsplash.com/photo-1522037576655-7a93ce0f4d10?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    // 'https://images.unsplash.com/photo-1570829053985-56e661df1ca2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    //
  ];

  @override
  Widget build(BuildContext context) {
    final tokenReader = ref.read(tokenProvider);
    return Scaffold(
      drawer: MainDrawer(onSelectedScreen: (String a) {}),
      appBar: AppBar(
        title: const Text("Categories"),
        backgroundColor: const Color.fromARGB(255, 67, 201, 201),
      ),
      body: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(10, 11, 10, 0),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.grey[300],
          ),
          child: const Row(
            children: [
              Icon(
                Icons.search,
              ),
              Text(
                'Search for a medicine',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        CarouselSlider.builder(
            carouselController: controller,
            itemCount: urlImages.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = urlImages[index];
              return buildImage(urlImage, index);
            },
            options: CarouselOptions(
                autoPlay: true,
                enableInfiniteScroll: false,
                autoPlayAnimationDuration: Duration(seconds: 3),
                enlargeCenterPage: true,
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index))),
        SizedBox(height: 12),
        buildIndicator(),
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(13, 11, 13, 1),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(20),
        //     child: Image(
        //       image: AssetImage('images/digital_health.jpg'),
        //     ),
        //   ),
        // ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
          child: Text(
            'Your Category',
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
        ),


          FutureBuilder<List<CategoryModel>>(
            future: AllCategoryService().getAllCategory(tokenReader.toString()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CategoryModel> categories = snapshot.data!;
                return
                    Expanded(
                      child: GridView.builder(
                          itemCount: categories.length,
                          clipBehavior: Clip.none,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.99,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 0,
                          ),
                          itemBuilder: (context, index) {
                            return CategoryGridItem(category: categories[index]);
                          }),
                    )

                ;
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() => Center(
        child: AnimatedSmoothIndicator(
          onDotClicked: animateToSlide,
          effect: ExpandingDotsEffect(
            dotWidth: 15,
            activeDotColor: Colors.blue,
            expansionFactor: 2,
          ),
          activeIndex: activeIndex,
          count: urlImages.length,
        ),
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String urlImage, int index) => Container(
    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
    //padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        urlImage,
        fit: BoxFit.cover,
      ),
    ));
