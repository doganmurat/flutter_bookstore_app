import 'package:flutter/material.dart';

class BookTab extends StatefulWidget {
  @override
  _BookTabState createState() => _BookTabState();
}

class _BookTabState extends State<BookTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildListItem("The Time Machine", "4","5","https://i.dr.com.tr/cache/154x170-0/originals/0001792624001-1.jpg"),
          _buildListItem("a", "1","1","https://i.dr.com.tr/cache/154x170-0/originals/0001792624001-1.jpg"),
        ],
      ),
    );
  }
  _buildListItem(String bookName, String rating, String price, String imgUrl){
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: [
                Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(7.0),
                      color: Color(0xFFFE3DF)
                  ),
                  child: Center(
                    child: Image(image: NetworkImage(imgUrl)),
                  ),
                ),
                SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        bookName,
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400)
                    ),
                    Row(
                      children: [
                        Text(
                            rating
                        ),
                        Icon(
                          Icons.star,size: 15,color: Colors.yellow,
                        )
                      ],
                    ),
                    Text(
                      price + "\$",style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
