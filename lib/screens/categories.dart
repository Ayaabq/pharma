// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/data/dummy_data_category.dart';
import 'package:pharma/data/dummy_data_medicine.dart';
import 'package:pharma/models/category.dart';
import 'package:pharma/models/category/category_model.dart';
import 'package:pharma/providers/auth_data_provider.dart';
import 'package:pharma/providers/user_provider.dart';
import 'package:pharma/screens/medicines.dart';
import 'package:pharma/screens/order_screen.dart';
import 'package:pharma/services/get_categories_service.dart';
import 'package:pharma/widgets/cart/cart_floating_button.dart';
import 'package:pharma/widgets/category_grid_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pharma/widgets/order_list.dart';
import 'package:pharma/widgets/search/search_button.dart';
import 'package:pharma/widgets/side_drawer/main_drawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:pharma/services/get_medicine_service.dart';
import 'package:pharma/models/medicine.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key});

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  void _selectCategory(CategoryModel category, int id, WidgetRef ref) async {
    final tokenWathcer = ref.watch(tokenProvider);

    final medicineWatcher = await ref
        .watch(medicineProvider)
        .getAllMedicine(tokenWathcer.toString(), id);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MedicinesScreen(
          title: category.name,
          medicines: medicineWatcher,
        ),
      ),
    );
  }

  // void _pressedCartButton() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (ctx) => OrderScreen(),
  //     ),
  //   );
  // }

  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    'assets/images/second_med.jpg',
    'assets/images/third_screen.jpg',
    'assets/images/digital_health.jpg',
  ];
  int _bottomNavIndex = 0;
  List<IconData> _Icons = [
    Icons.add_shopping_cart_outlined,
    Icons.account_circle_sharp,
    Icons.home,
    // Icons.access_alarms_rounded,
    // I
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tokenReader = ref.read(tokenProvider);
    Widget content;
    String title;
    if (_currentIndex == 0) {
      title = "Categories";
    } else {
      title = "your Orders";
    }
    if (_currentIndex == 0) {
      content = Column(
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
            child: const SearchButton(),
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
                return Expanded(
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
                        return CategoryGridItem(
                          category: categories[index],
                          onSelectedCategory: (int id) {
                            _selectCategory(categories[index], id, ref);
                          },
                        );
                      }),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      );
    } else {
      content = OrderList();
    }
    return Scaffold(
      drawer: MainDrawer(onSelectedScreen: (String a) {}),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color.fromARGB(255, 67, 201, 201),
      ),
      floatingActionButton: CartFloatingButton(
          // pressedIcon: _pressedCartButton,
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5.01,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          backgroundColor: Colors.teal,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              print(_currentIndex);
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                //color: Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Orders',
            ),
          ],
        ),
      ),
      body: content,
    );
  }

  Widget buildIndicator() => Center(
        child: AnimatedSmoothIndicator(
          onDotClicked: animateToSlide,
          effect: const ExpandingDotsEffect(
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
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
    //padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        urlImage,
        fit: BoxFit.cover,
      ),
    ));
