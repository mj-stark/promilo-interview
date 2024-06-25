import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_plus/share_plus.dart';


class Ontap extends StatefulWidget {
  const Ontap({super.key});

  @override
  State<Ontap> createState() => _OntapState();
}

class _OntapState extends State<Ontap> {
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Description'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: screenHeight * 0.42,
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
                                  count: 5,
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
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(-20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.download,
                                color: Colors.grey[800],
                                size: 25,
                              ),
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(Icons.bookmark_border,
                                  color: Colors.grey[800]
                                  ,size: 25,),
                                  
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(Icons.favorite_outline,
                                  color: Colors.grey[800],
                                  size: 25,),
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(Icons.fullscreen,
                                  color: Colors.grey[800],
                                  size: 25,),
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(Icons.star_border,
                                  color: Colors.grey[800],
                                  size: 25,),
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(Icons.share, color: Colors.grey[800],size: 25,),
                              onPressed: () {
                                Share.share('Clicked');
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.bookmark_border,
                    color: Colors.purple,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('1034'),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.purple,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('1034'),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.purple,
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.purple,
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.purple,
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.purple,
                          ),
                          Icon(
                            Icons.star_outline,
                            size: 15,
                            color: Colors.purple,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('3.2'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Actor Name',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Hidden Actress',style: TextStyle(color: Colors.grey[600]),),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16),
                      SizedBox(width: 4),
                      Text('Duration 20 Mins',style: TextStyle(color: Colors.grey[600]),),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.wallet, size: 16),
                      SizedBox(width: 4),
                      Text('Total Average Fees ₹9,999',style: TextStyle(color: Colors.grey[600]),),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(
                    'From cardiovascular health to fitness, flexibility, balance, stress relief, better sleep, increased cognitive performance, and more, surf therapy offers a wide range of benefits. If you\'re wondering what are the benefits of going on a surf camp...',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text('See More'),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
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
