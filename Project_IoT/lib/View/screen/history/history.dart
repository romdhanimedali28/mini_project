import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  width: 200,
                  color: Colors.green,
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 3,
                  width: 200,
                  color: Colors.grey,
                );
              },
              itemCount: 10),
        ),
      ),
    );
  }
}
