import 'package:flutter/material.dart';

class MyListPage extends StatelessWidget {
  const MyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha lista'),
      ),
      body: SizedBox(
        height: double.infinity,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.7,
          ),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.amber,
            );
          },
        ),
      ),
    );
  }
}
