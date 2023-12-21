import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/widgets/category_grid_item.dart';
import 'package:pharma/widgets/medicine_item.dart';
import 'package:pharma/widgets/search/search_text_field.dart';

import '../controllers/search_controller.dart';
import '../models/category/category_model.dart';
import '../models/medicine.dart';
import '../models/search.dart';
import '../providers/auth_data_provider.dart';
import '../services/get_medicine_service.dart';
import '../services/search_service.dart';
import '../utils/kcolors_utils.dart';
import 'medicines.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
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
  List<CategoryModel> categories = [];
  List<MedicineModel> medicines = [];
  // the state refer to the state of the widget
  // 0 if the results not found
  // 1 if the results are  categories
  // 2 if the results are medicines
  // and 3 if there is no results yet
  int state = 3;
  void _onEnter(WidgetRef ref) async {
    final tokenWatcher = ref.watch(tokenProvider);
    final search = Search(name: searchController.text);
    var data = await SearchServices().serch(search, tokenWatcher.toString());

    if (data == null) {

      setState(() {
        state=0;
      });
    } else if (data.containsKey(0)) {
      state=2;
      medicines = data[0]!.map((e) => MedicineModel.fromJson(e)).toList();
      categories=[];
      setState(() {

      });
      for (var e in medicines) {
        print(e.commercial_name);
      }
    } else if (data.containsKey(1)) {
      state=1;
      categories = data[1]!.map((e) => CategoryModel.fromJson(e)).toList();
      medicines=[];
      setState(() {

      });
      for (var e in categories) {
        print(e.name);
      }
    }
  }
  late FocusNode _focusNode;


  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget content =const  Text("No Results match");
    if(state!=0 && state!=3)
      content= Expanded(
        child: ListView.builder(
            itemCount: state==1? categories.length : medicines.length,
            itemBuilder: (context, index) {

              return ListTile(
                title:state==1?CategoryGridItem(category: categories[index], onSelectedCategory: (int id) { _selectCategory(categories[index], id, ref); },):
                MedicineItem(medicine: medicines[index],),
              );
            }),
      );
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 67, 201, 201)
      ),
      body: Column(children: [
        SearchTextField(
          onEnter: _onEnter,
          focusNode: _focusNode,
        ),
        if(state !=3)
          content
      ]),
    );
  }
}
