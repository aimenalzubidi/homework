import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  late String controller3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                labelText: 'Enter the Name',
                hintText: 'Aimen',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              controller: _controller1,
            ),
            SizedBox(height: 20),
            TextField(
              // textAlign: TextAlign.end,
              decoration: InputDecoration(
                labelText: ' the Name',
                // hintText: 'ahmed',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              controller: _controller2,
              readOnly: true,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 34, 59, 102),
              ),
              onPressed: () {
                setState(() {
                  _controller2.text = _controller1.text;
                });
              },
              child: Text("Sumit", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
