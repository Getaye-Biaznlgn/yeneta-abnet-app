import 'package:flutter/material.dart';
import '../model/pray_item.dart';
import '../screen/detail_page.dart';
import '../utils/styles.dart';

class SubItem extends StatelessWidget {
  const SubItem({required this.pray, Key? key}):super(key: key);
  final PrayItem pray;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(
                        pray: pray,
                      )));
        },
        child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
            child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 12.0),
                child: Text(pray.title ?? "", style: kListItemTextStyle))));
  }
}
