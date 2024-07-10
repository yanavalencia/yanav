import 'package:flutter/material.dart';

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
          backgroundColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              'assets/pirata.png',
              height: 60.0,
              width: 500.0,
            ),
          ),
        ),
        backgroundColor: Colors.red[300],
        body: Container(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/chawpanan.png',
                    width: 360,
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
