class Popular_model_getx {
  late String image,name,price , proInfo , desInfo;

  Popular_model_getx({this.image = "no image",this.name="no name",this.price="no price", this.proInfo = "no info", this.desInfo = "on info"});

  Popular_model_getx.fromJson(Map<String, dynamic> map){
    image = map['image'];
    name = map['name'];
    price = map['price'];
    proInfo = map['proInfo'];
    desInfo = map['desInfo'];
  }
}