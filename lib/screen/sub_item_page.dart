import 'package:flutter/material.dart';
import '../model/pray_category.dart';
import '../widget/sub_item.dart';

class SubItemPage extends StatelessWidget {
  final PrayCategory? category;
  const SubItemPage({required this.category, Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category!.name),),
      body: ListView.builder(
                        itemCount: category!.prays.length,
                        itemBuilder: (cxt, index) {
                          return SubItem(
                              pray: category!.prays[index]);
                        },
    )
    );
  }
}
