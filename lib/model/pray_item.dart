
class PrayItem {
  final int? id;
  final String? title;
  final String? content;
  final String? voicePath;

  PrayItem(
      {required this.id,
      required this.title,
      required this.content,
      required this.voicePath});

    factory PrayItem.fromJson(Map<String, dynamic> json)=>
       PrayItem(id: json['nibab_id'], title: json['title'], content: json['content'], voicePath: json['voice_path']);
    
}
