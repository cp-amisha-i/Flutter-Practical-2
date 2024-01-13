import 'package:flutter/material.dart';

class PersonDetailTab extends StatelessWidget {
  const PersonDetailTab({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                'Amisha Italiya',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.only(right: 12, left: 12),
              children: [
                buildTopImage(),
                const SizedBox(height: 10),
                const DetailGridView(),
                const SizedBox(height: 10),

              ],
          ),
        )
    );
  }

  Widget buildTopImage() {
    return CircleAvatar(
      radius: 80,
      child: ClipOval(
        child: Image.asset(
          'assets/Profile.jpg',
          fit: BoxFit.cover,
          width: 160, // Set width to avoid stretching within the CircleAvatar
          height: 160, // Set height to avoid stretching within the CircleAvatar
        ),
      ),
    );
  }
}

class DetailGridView extends StatelessWidget {
  const DetailGridView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: buildDetailCard(Icons.heart_broken_rounded, 'Heart Rate', const Color(0xffffffdf))),
            Expanded(child: buildDetailCard(Icons.do_not_step_sharp, 'Foot steps', const Color(0xffdff2ff))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: buildDetailCard(Icons.handshake_rounded, 'Strength', const Color(0xffdfffff))),
            Expanded(child: buildDetailCard(Icons.more_horiz_outlined, 'More', const Color(0xffffdfff))),
          ],
        ),
        const SizedBox(height: 10),
        buildDurationCard(),
        const SizedBox(height: 10),
        buildEndButton()
      ],
    );
  }

  Widget buildDetailCard(IconData icon, String title, Color colour) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      color: colour,
      child: Padding(
        padding: const EdgeInsets.only(top: 35, bottom: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                padding: const EdgeInsets.all(8),
                child: Icon(icon, size: 20, color: colour)),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget buildDurationCard() {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      color: const Color(0xffd1c4e9),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 35, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Duration', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: buildDurationBox('1-10 min')),
                Expanded(child: buildDurationBox('10-20 min')),
                Expanded(child: buildDurationBox('20-30 min')),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildDurationBox(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white60),
      child:
        Text(text, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black38, fontSize: 10)),
    );
  }

  Widget buildEndButton() {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.orangeAccent[100]),
      child:
      const Text('Show 20 workouts', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
    );
  }
}