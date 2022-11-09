







import 'package:flutter/material.dart';


import '../Cart/Cart.dart';





import '../StramBuilder/Bast_stream.dart';
import '../StramBuilder/Indoor_stream.dart';
import '../StramBuilder/Outdoor_stream.dart';
import '../StramBuilder/Popular_stream.dart';
import '../StramBuilder/Recomments_stream.dart';






import '../StramBuilder/Slider_stream.dart';
import '../favorite/favorite.dart';
import '../search/Popular_searchItems.dart';
import '../search/bast_searchItems.dart';
import '../search/indoor_searchItems.dart';
import '../search/outdoor_searchItems.dart';
import '../search/recommnets_searchItems.dart';

import 'ProfilePage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int activeIndex = 0;
  PageController _pageController = PageController();




  @override
  void initState() {
    super.initState();
  }
  @override
  int _seleteindex = 0;
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _buildAppbar,
      // drawer: drawer(),
      body: _buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _seleteindex = index;
            _pageController.animateToPage(_seleteindex, duration: Duration(seconds: 1), curve: Curves.linear);
          });
        },
        fixedColor: Colors.black,
        currentIndex: _seleteindex,
        // selectedItemColor: Colors.lightGreenAccent,
        items: [
         
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: Icon(Icons.home_filled,color: Colors.black,),),label: "Home",),
          BottomNavigationBarItem(
              icon: GestureDetector(child: Icon(Icons.favorite,color: Colors.red,),

                ),label: "Favorite"),
          BottomNavigationBarItem(icon: GestureDetector(
              child: Icon(Icons.shopping_cart_sharp,color: Colors.black,),

          ),label: "Cart"),
          BottomNavigationBarItem(icon: GestureDetector(
              child: Icon(Icons.account_circle,color: Colors.black,),

          ),label: "Profile"),
        ],
      ),
    );
  }


  get _buildAppbar{
    return AppBar(
      backgroundColor: Colors.white,
      title: Text("The Little Green", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.lightGreenAccent),),
    );
  }
  get _homePage{
    return Container(
      color: Colors.grey[300],
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          SizedBox(height: 10,),
          SliderStream(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recomments",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f1"),),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Recomments_Search()));
                    },
                    child: Text("View all",style: TextStyle(fontSize: 20,fontFamily: "f1",fontWeight: FontWeight.bold),)
                )
              ],
            ),
          ),

          //testing GETX
          // GetX_RecommentProducts(),


          RecommnetStream(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Bast Product",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f1"),),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Bast_Search()));
                    },
                    child: Text("View all",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f1"),)
                )
              ],
            ),
          ),
          BastStream(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular Product",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f1"),),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Popular_Search()));
                    },
                    child: Text("View all",style: TextStyle(fontSize: 20,fontFamily: "f1",fontWeight: FontWeight.bold),)
                )
              ],
            ),
          ),
          PopularStream(),
          // Popular_Stream_Getx(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Indoor Product",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f1"),),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Indoor_Search()));
                    },
                    child: Text("View all",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f1"),)
                )
              ],
            ),
          ),
          IndoorStream(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Outdoor Product",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, fontFamily: "f1"),),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Outdoor_Search()));
                    },
                    child: Text("View all",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f1"),)
                )
              ],
            ),
          ),
          OutdoorStream(),
        ],
      ),
    );
  }
  Widget _buildPageView(){
    return PageView(
      controller: _pageController,
      onPageChanged: (index){
        setState((){
          _seleteindex = index;

        });
      },

      children: [
        _homePage,
        FavoriteProduct(),
        myCarts(),

        ProfilePage()

      ],
    );
  }



}
