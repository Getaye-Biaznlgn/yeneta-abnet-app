import '../model/db_helper.dart';
import 'package:flutter/material.dart';
import '../widget/main_title_item.dart';
import '../model/pray_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DBHelper dbHelper = DBHelper();
  late Future _futureCategory;
  late List<PrayCategory> prayCategories;
  initDB() async {
    return await dbHelper.getPrayCategories();
  }

  @override
  void initState() {
    super.initState();
    _futureCategory = initDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('አብነት'), actions: <Widget>[
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () async {
                return showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('About'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: const <Widget>[
                            Text(
                                'ይህ መተግበሪያ አብነት ተማሪዎችን ለማገዝ እና የመምህራኑን ድካም ለመቀነስ ታስቦ የተሰራ ሲሆን '
                                'በጽሑፉ ላይ ወይም በድምጹ ላይ ማንኛውንም ግድፈት ወይም ጉድለት ካገኙ '
                                'ወይም አስተያየት መስጠት ከፈለጉ Google play store ወይም ከታች ያለውን አድራሻ መጠቀም ይችላሉ።\n'
                                ),
                            Text(
                              'የተቀረጸው ድምጽ የአብነት ት/ቤቶችን ለማገዝ በአሜሪካን ሀገር ካሊፎርኒያ ግዛት በሚኖሩ በአባ ላዕከ ማርያም ከተዘጋጀው ድህረ ገጽ ላይ የተወሰደ ነው።\n'
                              ),
                            Center(child: Text('ወስብሐት ለእግዚአብሔር\n ወለወላዲቱ ድንግል\n ወለመስቀሉ ክቡር\n ይቆየን!'),),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                                child: Text(
                              'Developed by Adey apps\n ethioptech21@gmail.com',
                            )),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text(
                            'OK',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Icon(
                Icons.info,
              ),
            )),
      ]),
      body: FutureBuilder(
          future: _futureCategory,
          builder: (context, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (dataSnapshot.error != null) {
                return const Center(
                  child: Text('Faild to load'),
                );
              } else {
                prayCategories = dataSnapshot.data as List<PrayCategory>;
                return ListView.builder(
                  itemCount: prayCategories.length,
                  itemBuilder: (cxt, index) {
                    return MainTitleItem(category: prayCategories[index]);
                  },
                );
              }
            }
          }),
    );
  }
}
