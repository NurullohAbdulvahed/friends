import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabletPage extends StatefulWidget {
  static final String id = "";
  const TabletPage({Key? key}) : super(key: key);

  @override
  _TabletPageState createState() => _TabletPageState();
}

class _TabletPageState extends State<TabletPage> {
  List<GridClass> listGrid=[
    GridClass("assets/images/kitchen.jpg"),
    GridClass("assets/images/kitchen2.jpg"),
    GridClass("assets/images/kitchen3.jpg"),
    GridClass("assets/images/kitchen4.jpg"),
    GridClass("assets/images/kitchen5.jpg"),
  ];
  List <FriendClass> friendList = [
    FriendClass(names: "Dinner SteakHouse",nameMeal: "deli"),
    FriendClass(names: "Fire Hyper",nameMeal: "burgers"),
    FriendClass(names: "Dinner SteakHouse",nameMeal: "brunch"),
    FriendClass(names: "Fire Hyper",nameMeal: "hot-dog"),
    FriendClass(names: "Dinner SteakHouse",nameMeal: "pizza"),
  ];

  List iconList = [
    Icon(FontAwesomeIcons.star),
    Icon(FontAwesomeIcons.star),
    Icon(FontAwesomeIcons.star),
    Icon(FontAwesomeIcons.starHalfAlt),
    Icon(FontAwesomeIcons.starHalfAlt),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            color: Colors.blue,
            padding: EdgeInsets.only(left: 10,right: 10),
            child: ListTile(
              subtitle: Text("by rating"),
              tileColor: Colors.white,
              leading: Icon(Icons.filter_list),
              title: Text("All restaurants"),
            ),
          ),
        ),
        leading: Icon(FontAwesomeIcons.utensils),
        title: Text("Friendly Eats"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15,right: 15,top: 10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1
                ),
                itemCount: listGrid.length,
                itemBuilder: (context, int i) {
                  return buildColumnGrid(i);
                },

              ),
            ),
          ],
        ),
      ),
    );
  }

  Card buildColumnGrid(int i) {
    return Card(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.3,
            child: Image.asset(listGrid[i].images,fit: BoxFit.cover,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                alignment: Alignment.topLeft,
                child: Text(friendList[i].names,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                alignment: Alignment.topLeft,
                child: Text("\$\$\$",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Icon(FontAwesomeIcons.solidStar,color: Colors.yellow,),
                SizedBox(width: 10,),
                Icon(FontAwesomeIcons.solidStar,color: Colors.yellow,),
                SizedBox(width: 10,),
                Icon(FontAwesomeIcons.solidStar,color: Colors.yellow,),
                SizedBox(width: 10,),
                Icon(FontAwesomeIcons.solidStar,color: Colors.yellow,),
                SizedBox(width: 10,),
                Icon(FontAwesomeIcons.starHalfAlt,color: Colors.yellow,),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child: Row(
              children: [
                Text("Sushi"),
                SizedBox(width: 10,),
                Text("•"),
                SizedBox(width: 10,),
                Text("Seatsle"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
class GridClass{
  String images;

  GridClass(this.images);
}
class FriendClass{
  String names;
  String nameMeal;
  FriendClass({required this.names,required this.nameMeal});
}
