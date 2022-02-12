import 'package:flutter/material.dart';
import '../screen/sub_item_page.dart';
import '../model/pray_category.dart';
import '../utils/styles.dart';

class MainTitleItem extends StatelessWidget {  
  const MainTitleItem({required this.category, Key? key}):super(key :key);
  final PrayCategory category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SubItemPage(category: category,)));
        },
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
          child: Container( padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0), 
          child: Text(category.name, style: kListItemTextStyle)
          )
         )
        );
  }
}
