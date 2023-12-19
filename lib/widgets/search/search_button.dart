import 'package:flutter/material.dart';
import 'package:pharma/screens/search_screen.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});


  _onSearch(BuildContext context){
   Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SearchScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){_onSearch(context);},
      child: const Row(
        children: [
          Icon(
            Icons.search,
          ),
          Text(
            'Search for a medicine or category',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
