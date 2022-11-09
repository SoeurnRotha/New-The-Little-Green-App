import 'package:flutter/material.dart';

import 'drawer.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Profile"),
      ),
      drawer: drawer(),
      body: _buildBody,

    );
  }
  get _buildBody {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 10),
                    child: CircleAvatar(
                      radius: 53,
                      backgroundColor: Colors.lightGreenAccent,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage("https://assets.teenvogue.com/photos/61ae6ef0b90b482510f4df98/2:3/w_899,h_1349,c_limit/ROSE%CC%81%20x%20Calm%20Sleep%20Story(1).jpg"),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("User name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text("Example@gmail.com",style: TextStyle(fontSize: 15),),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.purpleAccent
                          ),
                          alignment: Alignment.center,
                          child: Text("Edit",style: TextStyle(fontSize: 17),),
                        ),
                      )
                    ],
                  ),
                ],
              ),


            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text("My order"),
              leading: Icon(Icons.shop),
              onTap: (){

              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text("My delivery address"),
              leading: Icon(Icons.pin_drop_sharp),
              onTap: (){

              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text("Refer a friend"),
              leading: Icon(Icons.account_circle),
              onTap: (){

              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text("Teams & Conditions"),
              leading: Icon(Icons.file_copy),
              onTap: (){

              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text("About Us"),
              leading: Icon(Icons.info),
              onTap: (){

              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout),
              onTap: (){

              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
