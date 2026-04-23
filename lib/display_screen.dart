  import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  final List<Product> products;

  const DisplayScreen({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 16, 146, 83),
        centerTitle: true,
        title: Text('قائمة المنتجات'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: DataTable(
            columns: [
              DataColumn(
                label: Text(
                  'السعر',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'اسم المنتج',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: products
                .map(
                  (p) => DataRow(
                    cells: [
                      DataCell(Text('${p.price} \$')),
                      DataCell(Text(p.name)),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}
