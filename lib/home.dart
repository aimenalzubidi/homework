import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:tasks/display_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 16, 146, 83),
        centerTitle: true,
        title: Text('قراءة ملف إكسل'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: Icon(Icons.upload_file),
          label: Text('اختر ملف المنتج'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () => _pickAndParseExcel(context),
        ),
      ),
    );
  }

  Future<void> _pickAndParseExcel(BuildContext context) async {
    // 1. اختيار الملف
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      var bytes = File(result.files.single.path!).readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);
      List<Product> products = [];

      // 2. قراءة البيانات (نفترض أنها في الورقة الأولى)
      for (var table in excel.tables.keys) {
        // نتخطى السطر الأول لأنه عادة يكون "العنوان"
        var rows = excel.tables[table]!.rows;
        for (int i = 1; i < rows.length; i++) {
          var row = rows[i];
          products.add(
            Product(
              name: row[0]?.value.toString() ?? '',
              price: double.tryParse(row[1]?.value.toString() ?? '0') ?? 0.0,
            ),
          );
        }
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayScreen(products: products),
        ),
      );
    }
  }
}
