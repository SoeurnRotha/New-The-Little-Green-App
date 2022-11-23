import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DetailProduct_Tablat extends StatefulWidget {
  const DetailProduct_Tablat({Key? key, required this.image, required this.name, required this.price, required this.proInfo, required this.desInfo}) : super(key: key);


  final String image;
  final String name;
  final String price;
  final String proInfo;
  final String desInfo;


  @override
  State<DetailProduct_Tablat> createState() => _DetailProduct_TablatState();
}

class _DetailProduct_TablatState extends State<DetailProduct_Tablat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar,
      body: _buildBody,
      floatingActionButton: _buildButton,

    );
  }
  get _buildButton{
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[100],
          image: DecorationImage(
              image: AssetImage("images/icon/03.png"),
              fit: BoxFit.cover
            // fit: BoxFit.cover
          )

      ),
    );
  }

  get _buildAppbar {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded,size: 30,color: Colors.black,),
        onPressed: ()=> Navigator.pop(context),
      ),
      centerTitle: true,

      title: Text(widget.name, style: TextStyle(fontSize: 20,fontFamily: "f2",color: Colors.black),),
    );
  }

  get _buildBody{
    return Container(
      child: ListView(
        children: [
          _image,
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f2"),),
                Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.purpleAccent
                  ),
                  child: Text("${widget.price}\$",style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "f2"),),

                ),



              ],
            ),
          ),


          _buildTitle("Product information", widget.proInfo),
          _buildTitle("Description", widget.desInfo),

          SizedBox(height: 150,)

        ],
      )
    );
  }

  get _image{
    return Container(
      height: 550,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.image),
          fit: BoxFit.cover
        )
      ),
    );
  }

  Widget _buildTitle(String info, String text){
    return       Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(info,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "f2"),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(text,style: TextStyle(fontSize: 20,fontFamily: "f2"),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
