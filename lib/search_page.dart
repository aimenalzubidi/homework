import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<list> lists = [
    list('HomePage', 'This is a description for item 1.', Icons.home),
    list('SearchPage', 'This is a description for item 2.', Icons.search),
    list('SettingPage', 'This is a description for item 3.', Icons.settings),
    list('AccountPage', 'This is a description for item 4.', Icons.person),
    list('riting', 'This is a description for item 4.', Icons.star),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
        },
        itemCount: lists.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // إضافة التدرج اللوني
                begin: Alignment.centerLeft, // بداية التدرج من اليسار
                end: Alignment.centerRight, // نهاية التدرج إلى اليمين
                colors: [
                  Color.fromARGB(255, 180, 190, 214),
                  Color.fromARGB(255, 143, 167, 224),
                  Color.fromARGB(255, 44, 13, 137),
                ],
              ),

              borderRadius: BorderRadius.circular(25),
              color: Colors.lightBlue,
            ),
            child: ListTile(
              leading: Icon(lists[index].icon),
              title: Text(lists[index].title),
              subtitle: Text(lists[index].subtitle),
            ),
          );
        },
      ),
    );
  }
}

class list {
  final String title;
  final String subtitle;
  final IconData icon;
  list(this.title, this.subtitle, this.icon);
}
