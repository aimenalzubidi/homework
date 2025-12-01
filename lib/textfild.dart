import 'package:flutter/material.dart';
import 'package:homework/secand_page.dart';
import 'package:homework/thaerd_page.dart';


class Textfild extends StatefulWidget {
  const Textfild({super.key});

  @override
  State<Textfild> createState() => _TextfildState();
}

class _TextfildState extends State<Textfild> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  late String controller3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 34, 59, 102),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter the Name',
                hintText: 'ahmed',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              controller: _controller1,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: ' the Name',

                //  hintText:'ahmed' ,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              controller: _controller1,
              readOnly: true,
            ),
            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 34, 59, 102),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecandPage(name: _controller1.text),
                  ),
                );
              },
              child: Text('Secand Page', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 34, 59, 102),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThaerdPage(name: _controller1.text),
                  ),
                );
              },
              child: Text('Thaerd Page', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
