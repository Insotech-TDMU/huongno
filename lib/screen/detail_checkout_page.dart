import 'package:flutter/material.dart';


class DetailCheckoutPage extends StatefulWidget {
  const DetailCheckoutPage({Key? key}) : super(key: key);

  @override
  State<DetailCheckoutPage> createState() => _DetailCheckoutPageState();
}

class _DetailCheckoutPageState extends State<DetailCheckoutPage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 400,
                width: 400,
                child: InteractiveViewer(
                  panEnabled: false, // Set it to false
                  boundaryMargin:const EdgeInsets.all(100),
                  minScale: 0.5,
                  maxScale: 2,
                  child: Image.asset('assets/images/1.png'),
                )
            ) ,
            SizedBox(
                height: 400,
                width: 400,
                child: InteractiveViewer(
                  panEnabled: false, // Set it to false
                  boundaryMargin:const EdgeInsets.all(100),
                  minScale: 0.5,
                  maxScale: 2,
                  child: Image.asset('assets/images/2.png'),
                )
            ) ,
            SizedBox(
                height: 400,
                width: 400,
                child: InteractiveViewer(
                  panEnabled: false, // Set it to false
                  boundaryMargin:const EdgeInsets.all(100),
                  minScale: 0.5,
                  maxScale: 2,
                  child: Image.asset('assets/images/3.png'),
                )
            ) ,
            SizedBox(
                height: 400,
                width: 400,
                child: InteractiveViewer(
                  panEnabled: false, // Set it to false
                  boundaryMargin:const EdgeInsets.all(100),
                  minScale: 0.5,
                  maxScale: 2,
                  child: Image.asset('assets/images/4.png'),
                )
            ) ,
          ],
        ),
      )
    );
  }
}
