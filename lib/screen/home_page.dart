import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:huongno/constant/app_font_size.dart';
import 'package:huongno/constant/app_secure_storage.dart';
import 'package:huongno/screen/bloc/authentication_bloc.dart';
import 'package:huongno/screen/detail_checkout_page.dart';
import 'package:huongno/screen/file_book_page.dart';
import 'package:huongno/screen/login_page.dart';
import 'package:huongno/widgets/app_button.dart';
import 'package:huongno/widgets/app_dialog.dart';
import 'package:huongno/widgets/loading_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? title;
  Widget page = const LoadingPage();
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }
  void checkLogin() async {
    String token = await AppStorage.getUserToken();
    if (token != null) {
      setState(() {
        page = const HomePage();
      });
    } else {
      setState(() {
        page = const LoginPage();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:  Text('TRang chủ'.toUpperCase()),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            Image.asset('assets/images/logo-home.png'),
            const SizedBox(height: 30,),
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

            const SizedBox(height: 30,),


          ],
        ),
      )
    );
  }
}
