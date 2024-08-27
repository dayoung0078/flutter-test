import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'coffee',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        primaryColor: Color(0x3A20FF0F),
      ),
      home: TabbedCoffeeApp(),
    );
  }
}

class TabbedCoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('MY COFFEE'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.coffee_outlined), text: "Menu"),
              Tab(icon: Icon(Icons.settings), text: "Settings"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Hi! Wecome to Our coffee Shop")),
            CoffeeListScreen(),
            Center(child: Text("Settings Page")),
          ],
        ),
      ),
    );
  }
}

class CoffeeListScreen extends StatefulWidget {
  @override
  _CoffeeListScreenState createState() => _CoffeeListScreenState();
}

class _CoffeeListScreenState extends State<CoffeeListScreen> {
  final List<Map<String, dynamic>> coffees = [
    {"name": "하와이안에이드", "description": "상큼한 탄산에이드", "image": "assets/image1.png", "isLiked": false},
    {"name": "돌체라떼", "description": "달달한 연유라떼", "image": "assets/image2.png", "isLiked": false},
    {"name": "라임에이드", "description": "탄산과 시원함", "image": "assets/image3.png", "isLiked": false},
    {"name": "한라봉프라프치노", "description": "제주 한정메뉴", "image": "assets/image4.png", "isLiked": false},
    {"name": "크림 콜드브루", "description": "씁쓸한 보드러운", "image": "assets/image5.png", "isLiked": false},
    {"name": "망고프라프치노", "description": "여름 한정메뉴", "image": "assets/image6.png", "isLiked": false},
    {"name": "아이스라떼", "description": "클래식 커피메뉴", "image": "assets/image7.png", "isLiked": false},
  ];

  void toggleLike(int index) {
    setState(() {
      coffees[index]["isLiked"] = !coffees[index]["isLiked"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coffees.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(coffees[index]["image"], width: 50, height: 50, fit: BoxFit.cover),
            title: Text('${index + 1}. ${coffees[index]["name"]}', style: TextStyle(color: Colors.teal)),
            subtitle: Text(coffees[index]["description"]),
            trailing: IconButton(
              icon: Icon(
                coffees[index]["isLiked"] ? Icons.favorite : Icons.favorite_border,
                color: Colors.purpleAccent,
              ),
              onPressed: () => toggleLike(index),
            ),
          ),
        );
      },
    );
  }
}