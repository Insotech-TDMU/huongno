import 'package:flutter/material.dart';
import 'package:huongno/screen/detail_checkout_page.dart';
import 'package:huongno/screen/file_book_page.dart';
import 'package:huongno/widgets/master_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      title: Text('Trang chủ'.toUpperCase()),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child:InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DetailCheckoutPage()));
                },
                child:  Container(
                  // height: MediaQuery.of(context).size.height * 1 / 10,
                  // width: MediaQuery.of(context).size.width * 3 / 5,
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue,
                          Colors.deepOrange,
                        ]),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(""),
                      const Text(
                        "Bảng giá dịch vụ",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: const Icon(
                            Icons.arrow_right_alt_outlined,
                            size: 25.0,
                            color: Colors.green,
                          ))
                    ],
                  ),
                ),
              )
          ),
          const SizedBox(height: 50,),
          Center(
            child:InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FileBookPage()));
              },
              child:  Container(
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blue,
                        Colors.deepOrange,
                      ]),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(""),
                    const Text(
                      "Hồ sơ bệnh",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: const Icon(
                          Icons.arrow_right_alt_outlined,
                          size: 25.0,
                          color: Colors.green,
                        ))
                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
