import 'package:flutter/material.dart';
import 'package:instagram/feed.dart';
class Homepage extends StatefulWidget {
 static final String id="home_page";

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentPage = 0;
  var _pages =[
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text("Instagram",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.camera_alt,color: Colors.white,),
          onPressed: (){},
        ),
        actions: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: Icon(Icons.tv,color: Colors.white,),onPressed: (){},),
              IconButton(icon: Icon(Icons.send_sharp,color: Colors.white,),onPressed: (){},),
            ],
          ),
        ],
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i){
          setState((){
            currentPage =i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.white,),
            label: "Home"
          ), BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded,color: Colors.white,),
            label: "Search",
          ), BottomNavigationBarItem(
            icon: Icon(Icons.add_circle,color: Colors.white,),
            label: "Unplod",
          ), BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken,color: Colors.white,),
            label: "Likes",
          ),BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.white,),
            label: "Accaunt",
          ),

        ],
      ),

    );
  }
}
