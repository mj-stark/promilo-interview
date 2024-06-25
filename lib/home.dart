import 'package:flutter/material.dart';
import 'package:flutter_application_1/ontap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Individual Meetup'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.mic),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Image carousel
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: screenHeight * 0.25,
                  child: Stack(
                    children: [
                      PageView(
                        controller: _pageController,
                        children: [
                          Image.network(
                            'https://via.placeholder.com/350x150',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          Image.network(
                            'https://via.placeholder.com/350x150',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          Image.network(
                            'https://via.placeholder.com/350x150',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: SmoothPageIndicator(
                            controller: _pageController,
                            count: 3,
                            effect: WormEffect(
                              dotHeight: 8,
                              dotWidth: 8,
                              activeDotColor: Colors.purple,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Trending Popular People
              const Text(
                'Trending Popular People',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: ScrollPhysics(),
                child: Row(
                  children: [
                    Row(children: [
                      Row(
                        children: [
                          for (var i = 0; i < 3; i++)
                            Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    width: screenWidth * 0.8,
    height: screenHeight * 0.23,
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      border: Border.all(
        color: Colors.black,
        width: 0.5,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Author',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  '1028 Meetups',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 2),
        // Divider line
        Divider(color: Colors.grey),
        const SizedBox(height: 2),
        SizedBox(
          height: 50, // Ensure the container has a fixed height
          child: Stack(
            children: [
              for (var j = 0; j < 5; j++)
                Positioned(
                  left: j * 35.0, // Adjust the spacing between avatars
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey.shade300,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(Colors.white),
              backgroundColor: WidgetStatePropertyAll(Colors.purple),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Customize border radius here
                ),
              ),
            ),
            onPressed: () {},
            child: Text('See More'),
          ),
        ),
      ],
    ),
  ),
)

                        ],
                      ),
                    ])
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              const Text(
                'Top Trending Meetups',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics:
                    ScrollPhysics(), // Allow scrolling even when content isn't overflowing
                child: Container(
                  width: 500, // Example width, adjust as needed
                  child: Row(
                    children: [
                      GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ontap()),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ontap()),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ontap()),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                ),
              ),
            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        fixedColor: Colors.purple,
        backgroundColor: Colors.purple,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.keyboard_command_key_sharp), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.handshake_outlined), label: 'Meet up'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
