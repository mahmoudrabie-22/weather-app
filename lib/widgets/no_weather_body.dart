import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
   NoWeatherBody({Key? key,this.message});

  final String? message;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message??"there is no weather😔start", style: TextStyle(fontSize: 30)),
            Text('searching now 🔍', style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
