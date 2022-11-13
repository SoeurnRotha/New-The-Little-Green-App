import 'package:flutter/cupertino.dart';

class Responsive_Laout extends StatelessWidget {
  // const Responsive_Laout({Key? key}) : super(key: key);
  final Widget mobileApp ;
  final Widget webApp ;
  const Responsive_Laout({Key? key, required this.mobileApp, required this.webApp}) : super(key: key);



  // Responsive_Laout(this.mobileApp ,this.webApp);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context , layout){
        if(layout.maxWidth <600){
          return mobileApp;
        }else{
          return webApp;
        }
      },
    );
  }
}
