import 'package:flutter/material.dart';
import 'package:pharma/widgets/search/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SearchTextField(),
        ),
      ),
    );
  }
}
