import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height;

    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 59, 102),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 170,
              width: double.infinity,
              color: const Color.fromARGB(255, 34, 59, 102),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/cv.png'),
                    ),
                  ),
                  const Text(
                    "Eng: Aimen Najib Al-Zubidi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Mobile Developer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: height * 0.70,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                // padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Email:",
                          style: TextStyle(
                            color: Color.fromARGB(255, 34, 59, 102),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "aimenalzubidi@gmail.com ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Phone:",
                          style: TextStyle(
                            color: Color.fromARGB(255, 34, 59, 102),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "733678299",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
