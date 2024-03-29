import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class DetailProduct_Mobile extends StatefulWidget {
  const DetailProduct_Mobile({Key? key, required this.image, required this.name, required this.price, required this.proInfo, required this.desInfo}) : super(key: key);

  final String image;
  final String name;
  final String price;
  final String proInfo;
  final String desInfo;


  @override
  State<DetailProduct_Mobile> createState() => _DetailProduct_MobileState();
}

class _DetailProduct_MobileState extends State<DetailProduct_Mobile> {

  final Uri _url = Uri.parse('https://www.facebook.com/profile.php?id=100063546492674');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar,
      body: _buildBody,
      floatingActionButton: _buildButton,

    );
  }
  get _buildButton{
    return GestureDetector(
      onTap: _launchUrl,
      child: Container(
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

      title: Text(widget.name, style: TextStyle(fontSize: 20,fontFamily: "f1",color: Colors.black),),
    );
  }

  get _buildBody{
    return Container(
      child: ListView(
        children: [
          _buildImageProduct,

          Container(
            alignment: Alignment.center,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.name,style: TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold),),
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey
                  ),
                    child: Center(child: Text("${widget.price}\$",style: TextStyle(fontFamily: "f2",fontWeight: FontWeight.bold,fontSize: 20),))
                ),

              ],
            )

          ),

          _buildTitle("Product information", widget.proInfo),
          _buildTitle("Description",widget.desInfo)
          ,SizedBox(height: 100,),
        ],

      ),
    );
  }

  get _buildImageProduct{
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.image),
          fit: BoxFit.cover,
        )
      ),

    );
  }
  Widget _buildTitle(String info, String text){
    return     Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(info,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "f2",fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  text,style: TextStyle(fontSize: 18,fontFamily: "f2"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
