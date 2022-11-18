import 'package:flutter/material.dart';
class search_items extends StatefulWidget {
  const search_items({Key? key,  this.Istrue = false}) : super(key: key);
  final bool Istrue;

  @override
  State<search_items> createState() => _search_itemsState();
}

class _search_itemsState extends State<search_items> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("https://cdn.shopify.com/s/files/1/0150/6262/products/the-sill_coffee-plant_variant_small_grant_blush.jpg?v=1653528941"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name product",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("\$2.99",style: TextStyle(fontSize: 15),),
                SizedBox(height: 10,),

                //use for click add products
                widget.Istrue ? GestureDetector(
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text("Add",style: TextStyle(fontSize: 15,),),
                      ],
                    ),
                  ),
                ) : GestureDetector(
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete),
                        Text("Delete",style: TextStyle(fontSize: 15,),),
                      ],
                    ),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
