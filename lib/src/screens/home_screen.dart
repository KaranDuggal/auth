import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var cart = FlutterCart();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              horizontal:10,
              vertical: 10, 
            ),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Container(
                          width: 55.0,
                          height: 55.0,
                          // color:Colors.green,
                          child: CircleAvatar(
                            // backgroundColor: Colors.red,
                            // foregroundColor: Colors.red,
                            backgroundImage: NetworkImage("https://images.freeimages.com/images/large-previews/e4a/surf-3-1378236.jpg"),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.0,
                            ),
                            Text("Karan Duggal",style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold),),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text("Flutter Developer",style: TextStyle(color: Colors.grey/* ,fontSize: 12.0,fontWeight: FontWeight.bold */),),
                          ],
                        )
                      ]
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0
                      ),
                      child: ElevatedButton(
                        onPressed: (){
                          
                        },
                        child:Text("data"),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      )
    );
  }
}
