import 'package:flutter/material.dart';
import 'person_detail.dart';
import 'history.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({super.key});

  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  int currentIndex = 0;
  List<Widget> items = [
    const HomeTab(),
    const HistoryTab(),
    const PersonDetailTab()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: items.elementAt(currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            onTap: onTap,
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(label: '', icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: '', icon: Icon(Icons.watch_later_outlined)),
              BottomNavigationBarItem(label: '', icon: Icon(Icons.people_alt)),
            ],
          ),
        ),
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
            padding: const EdgeInsets.only(right: 12, left: 12),
            children: const [
              HeaderView(),
              SizedBox(height: 8),
              WorkoutListView(),
              SizedBox(height: 12),
              Text(
                'Workout programs',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 20),
              WorkoutProgramTopView(),
              SizedBox(height: 20),
              CoachCardView(),
              SizedBox(height: 10),
              LocationCardView(),
              SizedBox(height: 10),
            ]
        ),
      ),
    );
  }
}

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  final double profileHeight = 50;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good morning, Amisha!',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
            Text(
              'Ready to workout?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            )
          ],
        ),
        CircleAvatar(
          radius: profileHeight / 2,
          backgroundImage: const AssetImage('assets/Profile.jpg'),
        )
      ],
    );
  }
}

class WorkoutListView extends StatelessWidget {
  const WorkoutListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildListCardView(Icons.heart_broken_rounded, 'Heart Rate', '78 BPM',
              const Color(0xffffffdf), Colors.yellow),
          buildListCardView(Icons.sports_football, 'Steps', '6200 M',
              const Color(0xffdff2ff), Colors.blue),
          buildListCardView(Icons.streetview, 'Strength', '48 BMI',
              const Color(0xfffffff4), Colors.brown),
          buildListCardView(Icons.heart_broken_rounded, 'Heart Rate', '78BPM',
              const Color(0xfffff9c4), Colors.yellow),
        ],
      ),
    );
  }

  Widget buildListCardView(IconData icon, String title, String value,
      Color colour, Color iconColor) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      color: colour,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 1, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                padding: const EdgeInsets.all(10),
                child: Icon(icon, size: 20, color: iconColor)),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 10),
            ),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutProgramTopView extends StatelessWidget {
  const WorkoutProgramTopView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            buildWorkoutButton('All type'),
            buildWorkoutButton('Full body'),
            buildWorkoutButton('Chest'),
            buildWorkoutButton('Legs'),
            buildWorkoutButton('Abs')
          ],
        )
    );
  }

  Widget buildWorkoutButton(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 5, left: 2),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w600), // Customize the text style
          ),
        ),
      ),
    );
  }
}

class CoachCardView extends StatelessWidget {
  const CoachCardView({super.key});

  final double profileHeight = 16;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        // margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: const Color(0xffdff8ff),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Coach:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Text(
                'Stretch',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Text(
                '12pm - 20pm',
                style: TextStyle(fontSize: 10),
              ),
              const SizedBox(height: 20),
              buildImageStack(),
            ],
          ),
        )
    );
  }

  Widget buildImageStack() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        getRoundImage(),
        Positioned(
          left: profileHeight,
          child: getRoundImage(),
        ),
        Positioned(
          left: profileHeight * 2,
          child: getRoundImage(),
        ),
        Positioned(
          left: profileHeight * 3,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.white),
            padding: const EdgeInsets.all(4.8),
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget getRoundImage() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: CircleAvatar(
        radius: profileHeight,
        backgroundImage: const AssetImage('assets/Profile.jpg'),
      ),
    );
  }
}

class LocationCardView extends StatelessWidget {
  const LocationCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [buildLocation(), const SizedBox(width: 14), buildMapCard()],
    );
  }

  Widget buildLocation() {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      color: const Color(0xfffff6ff),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 50, bottom: 50, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                padding: const EdgeInsets.all(10),
                child: const Icon(Icons.location_on,
                    size: 16, color: Colors.black)),
            const SizedBox(height: 8),
            const Text(
              'see',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Route',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMapCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.asset(
        'assets/Map.png',
        height: 170,
      ),
    );
  }
}

class BottomTabBarView extends StatelessWidget {
  const BottomTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(tabs: [
      Tab(icon: Icon(Icons.home)),
      Tab(icon: Icon(Icons.people)),
      Tab(icon: Icon(Icons.calendar_month_sharp)),
      Tab(icon: Icon(Icons.gif_box_outlined)),
      Tab(icon: Icon(Icons.mark_chat_unread_outlined)),
    ]);
  }
}
