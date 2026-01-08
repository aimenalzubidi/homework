import 'package:flutter/material.dart';
import 'package:tasks/db_helper.dart';
import 'package:tasks/user_model.dart';

class SqlDb extends StatefulWidget {
  const SqlDb({super.key});

  @override
  State<SqlDb> createState() => _SqlDbState();
}

class _SqlDbState extends State<SqlDb> {
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {
    users = await DBHelper.instance.getUsers();
    setState(() {});
  }

  void showAddDialog() {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('إضافة مستخدم'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'الاسم'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'رقم الجوال'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'الإيميل'),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء', style: TextStyle(color: Colors.black)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 177, 174, 166),
            ),
            onPressed: () async {
              if (nameController.text.isEmpty ||
                  phoneController.text.isEmpty ||
                  emailController.text.isEmpty) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('جميع الحقول مطلوبة')));
                return;
              }
              await DBHelper.instance.insertUser(
                UserModel(
                  name: nameController.text,
                  phone: phoneController.text,
                  email: emailController.text,
                ),
              );



              
              Navigator.pop(context);
              loadUsers();
            },
            child: const Text('إضافة', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 177, 174, 166),
        centerTitle: true,
        title: const Text('SQLite '),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 177, 174, 166),
        onPressed: showAddDialog,
        child: const Icon(Icons.add, color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10);
          },
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Dismissible(
              key: Key(user.id.toString()),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(255, 219, 216, 206),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 177, 174, 166),
                    child: const Icon(Icons.person, color: Colors.black),
                  ),
                  title: Text(user.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('📞 ${user.phone}'),
                      Text('✉️ ${user.email}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.black),
                    onPressed: () async {
                      await DBHelper.instance.deleteUser(user.id!);
                      loadUsers();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('تم حذف المستخدم بنجاح')),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
