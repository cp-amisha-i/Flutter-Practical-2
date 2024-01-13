import 'package:flutter/material.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                'Full Strength',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            body: Column(
              children: [
                const SizedBox(height: 40),
                Image.asset(
                    'assets/Gym.png',
                  height: 400,
                  fit: BoxFit.fill,
                ),
                const Spacer(),
                buildStopWatch(),
                const SizedBox(height: 20),
              ],
            )
        )
    );
  }

  Widget buildStopWatch() {
    return Container(
        margin: const EdgeInsets.only(right: 20, left: 20),
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: const Color(0xfffff3e0)),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Rap 26'), Text('Set 2/5')],
            ),
            const SizedBox(height: 0),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.orangeAccent[100], // Set your desired background color
              child: const Text('24', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('start'),
                Text('Pause', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text('Stop')
              ],
            )
          ],
        )
    );
  }
}
