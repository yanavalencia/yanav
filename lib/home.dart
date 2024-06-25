import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text ('User Profile'),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:<Widget>[
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                  child: CircleAvatar(
                    child: Image.asset('assets/yana image.jpg'),
                    radius:47.0,
                  ),
                    ),
                  Divider(height: 55.0,
                  color: Colors.black,
                  thickness: 5.0,),
                  Row(
                      children: [
                        Icon(
                        Icons.person_2,
                        color: Colors.white,
                        ),
                        SizedBox(width: 3.0),
                        Text(
                          'NAME',
                          style:TextStyle(
                            fontSize: 16.0,
                            letterSpacing: 1.0,
                          ) ,
                        ),
                      ],
                    ),
                    Text(
                      'Yana Laurice A. Valencia',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25.0,
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    Text(
                      'YEAR',
                      style:TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1.0,
                      ) ,
                    ),
                    Text(
                      '3rd Year',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25.0,
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    Text(
                      'EMAIL',
                      style:TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1.0,
                      ) ,
                    ),
                    Text(
                      'yanalaurice@gmail.com',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: (){},
                child:Text ('Add Year'),
               ),
          ],
        ),
          ],
       ),
      ),
    );
  }
}
