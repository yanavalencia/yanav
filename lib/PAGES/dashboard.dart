import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          elevation: 3.0,
          onTap: (int val){
            switch(val){
              case 0:
                Navigator.pushNamed(context, '/menu');
                break;
              case 1:
                Navigator.pushNamed(context, '/profile');
                break;
            }
          },
          currentIndex: 0,
          items: const[
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood),
                label: 'Menu'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile'
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              'assets/pirata.png',
              height: 60.0,
              width: 500.0,
            ),
          ),
        ),
        backgroundColor: Colors.red[200],
        body: Container(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/dashboard.jpg'),
                  fit: BoxFit.cover
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterCarousel(
                    options: CarouselOptions(
                      height: 400.0,
                      showIndicator: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      autoPlayAnimationDuration: Duration(milliseconds: 700),
                      slideIndicator: CircularSlideIndicator(),
                    ),
                    items: [
                      'assets/dos.jpg',
                      'assets/uno.jpg',
                      'assets/chawsisig.jpg',
                      'assets/chawtapa.jpg',
                      'assets/dos.jpg'
                    ].map((String imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
