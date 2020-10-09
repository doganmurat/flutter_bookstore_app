import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bookstore_app/bookstab.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, color: Colors.black),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6.0,
                          spreadRadius: 4.0,
                          offset: Offset(0.0, 3.0))
                    ],
                    color: Color(0xFFC6E7FE),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://image.flaticon.com/icons/png/512/21/21104.png"),
                        fit: BoxFit.contain),
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text("SEARCH FOR",
                  style:
                  TextStyle(fontSize: 27.0, fontWeight: FontWeight.w800))),
          Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text("BOOKS",
                  style:
                  TextStyle(fontSize: 27.0, fontWeight: FontWeight.w800))),
          SizedBox(height: 25.0),
          Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                padding: EdgeInsets.only(left: 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(fontSize: 14.0),
                    border: InputBorder.none,
                    fillColor: Colors.grey.withOpacity(0.5),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )),
          SizedBox(height: 20.0),
          Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text("Recomended",
                  style:
                  TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500))),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListItem('Son Curet', 'https://i.dr.com.tr/cache/154x170-0/originals/0001889645001-1.jpg', '21', Color(0xFFC2185B).withOpacity(0.3),Color(0xFFC2185B)),
                _buildListItem('Anne of Green', 'https://i.dr.com.tr/cache/154x170-0/originals/0001736865001-1.jpg', '21',  Color(0xFF512DA8).withOpacity(0.3),Color(0xFF512DA8)),
                _buildListItem('The Little Prince', 'https://i.dr.com.tr/cache/154x170-0/originals/0000000645722-1.jpg', '21',  Color(0xFF388E3C).withOpacity(0.3),Color(0xFF388E3C)),
                _buildListItem('Jane Eyre', 'https://i.dr.com.tr/cache/154x170-0/originals/0001801963001-1.jpg', '21',  Color(0xFFFBC02D).withOpacity(0.3),Color(0xFFFBC02D)),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left:15.0),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
              unselectedLabelStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
              tabs: [
                Tab(child: Text('FEATURED'),),
                Tab(child: Text('DRAMA'),),
                Tab(child: Text('ACTION'),),
                Tab(child: Text('SCI-FI'),),
                Tab(child: Text('LANGUAGE'),),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height - 450.0,
              child: TabBarView(
                controller: tabController,
                children: [
                  BookTab(),
                  BookTab(),
                  BookTab(),
                  BookTab(),
                  BookTab(),
                ],
              )
          )
        ],
      ),
    );
  }

  _buildListItem(String bookName, String imgUrl, String price, Color bgColor, Color textColor) {
    return Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 175.0,
            width: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: bgColor
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: bookName,
                  child: Container(
                      height: 75.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image(image: NetworkImage(imgUrl),height: 50.0, width: 50.0),
                      )
                  ),
                ),
                SizedBox(height: 25.0),
                Text(bookName,style: TextStyle(fontSize: 17.0,color: textColor)),
                Text('\$' + price,style: TextStyle(fontSize: 20.0,color: textColor)),
              ],
            ),
          ),
        )
    );
  }
}
