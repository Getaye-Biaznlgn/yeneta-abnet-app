import './pray_item.dart';
class PrayCategory {
  final int id;
  final String name;
  final List<PrayItem> prays;
  PrayCategory({required this.id, required this.name, required this.prays});

  factory PrayCategory.fromJson(Map<String, dynamic> json) =>
      PrayCategory(id: json['id'], name: json['name'], prays: List<PrayItem>.from(json["items"].map((x) => PrayItem.fromJson(x))) );
}
